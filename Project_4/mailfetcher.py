import imaplib
import email
from email.header import decode_header
import os

def clean(text):
    return "".join(c if c.isalnum() else "_" for c in text)

def download_attachments_from_label(gmail_user, gmail_password, label_name, sender_email):
    import imaplib
    import email
    from email.header import decode_header
    import os

    def clean(text):
        return "".join(c if c.isalnum() else "_" for c in text)

    imap = imaplib.IMAP4_SSL("imap.gmail.com")

    try:
        imap.login(gmail_user, gmail_password)
        print("Login successful!")

        # List all labels
        status, folders = imap.list()
        if status == "OK":
            print("Available labels:")
            for folder in folders:
                print(folder.decode())

        # Select the specific label
        status, messages_count = imap.select(label_name)
        if status != "OK":
            print(f"Failed to access label: {label_name}")
            return

        print(f"Accessed label: {label_name}")

        # Search emails from the specific sender
        search_query = f'FROM "{sender_email}"'
        status, messages = imap.search(None, search_query)

        if status != "OK":
            print(f"No messages found from {sender_email} in label {label_name}")
            return

        email_ids = messages[0].split()
        print(f"Found {len(email_ids)} emails from {sender_email} in label {label_name}")

        for email_id in email_ids:
            try:
                res, msg = imap.fetch(email_id, "(RFC822)")
                if res != "OK":
                    print(f"Failed to fetch email ID {email_id}")
                    continue

                for response_part in msg:
                    if isinstance(response_part, tuple):
                        msg = email.message_from_bytes(response_part[1])

                        # Decode email subject
                        try:
                            subject = decode_header(msg["Subject"])[0][0]
                            if isinstance(subject, bytes):
                                subject = subject.decode(errors="replace")
                        except Exception as e:
                            print(f"Error decoding subject: {e}")
                            subject = "Unknown Subject"

                        print(f"Processing email with subject: {subject}")

                        if msg.is_multipart():
                            for part in msg.walk():
                                if part.get_content_disposition() == "attachment":
                                    try:
                                        filename = part.get_filename()
                                        if filename:
                                            filename = decode_header(filename)[0][0]
                                            if isinstance(filename, bytes):
                                                filename = filename.decode(errors="replace")
                                            filename = clean(filename)
                                            filepath = os.path.join(".", filename)
                                            with open(filepath, "wb") as f:
                                                f.write(part.get_payload(decode=True))
                                            print(f"Saved attachment: {filename}")
                                    except Exception as e:
                                        print(f"Error decoding or saving attachment: {e}")

            except Exception as e:
                print(f"Error processing email ID {email_id}: {e}")
                continue

        imap.close()
        imap.logout()
    except Exception as e:
        print(f"An error occurred: {e}")

# Usage
if __name__ == "__main__":
    # Replace with your Gmail credentials and label name
    gmail_user = ""
    gmail_password = ""
    label_name = ""  # Replace with your label's full name
    sender_email = ""
    
    download_attachments_from_label(gmail_user, gmail_password, label_name, sender_email)