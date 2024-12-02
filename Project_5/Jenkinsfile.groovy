podTemplate(
    yaml: '''
apiVersion: v1
kind: Pod
metadata:
  name: jenkins-agent
  labels:
    jenkins: agent
spec:
  serviceAccountName: jenkins-admin
  containers:
  - name: agent-1
    image: iyadomry/jenkins_all_in_one:v15
    securityContext:
        privileged: true
    command:
    - cat
    tty: true
'''
) {
    node(POD_LABEL) {
        stage('Interact with Kubernetes') {
            container('agent-1') {
            checkout scm
            sh "kubectl version --client"
            sh "java -version"
            sh "python3 --version"
            sh "aws --version"
            sh "az --version"
            sh "gcloud --version"
            sh "sshpass -V"
            }
        }
    }
}
