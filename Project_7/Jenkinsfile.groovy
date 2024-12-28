podTemplate(
    yaml: '''
apiVersion: v1
kind: Pod
metadata:
  labels:
    jenkins: agent
spec:
  containers:
    - name: docker
      image: docker:20-dind
      securityContext:
        privileged: true
      volumeMounts:
        - name: docker-graph-storage
          mountPath: /var/lib/docker
  volumes:
    - name: docker-graph-storage
      emptyDir: {}
    '''
) {
    node(POD_LABEL) {
        stage('Verify Docker Access') {
            container('docker') {
                checkout scm
                dir('Project_7') {
                    sh 'docker build -t jenkins_all_in_one . | tee build.log'
                }
            }
        }
    }
}
