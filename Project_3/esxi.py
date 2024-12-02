from pyVim.connect import SmartConnect, Disconnect
from pyVmomi import vim
import ssl

def esxi_vms_info():
    # Disable SSL certificate verification (use with caution)
    context = ssl._create_unverified_context()

    # Connect to the ESXi host
    si = SmartConnect(
        host='192.168.1.232',
        user='root',
        pwd='!',
        sslContext=context
    )

    # Function to get all VMs
    def get_all_vms(content):
        obj_view = content.viewManager.CreateContainerView(content.rootFolder, [vim.VirtualMachine], True)
        vms = obj_view.view
        obj_view.Destroy()
        return vms

    # Get the content of the service instance
    content = si.RetrieveContent()

    # Get all VMs
    vms = get_all_vms(content)

    # List to hold VM details
    vm_details_list = []

    # Collect VM details
    for vm in vms:
        summary = vm.summary
        ip_address = 'N/A'
        if vm.guest is not None:
            ip_address = vm.guest.ipAddress if vm.guest.ipAddress else 'N/A'
        
        vm_details = {
            "Name": summary.config.name,
            "Path": summary.config.vmPathName,
            "Guest": summary.config.guestFullName,
            "State": summary.runtime.powerState,
            "IP Address": ip_address
        }
        
        vm_details_list.append(vm_details)

    # Disconnect from the host
    Disconnect(si)

    # Return the list of VM details
    return vm_details_list

esxi_vms_info()