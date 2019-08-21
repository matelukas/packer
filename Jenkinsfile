def packer_dir = "/mnt/nfs/packer"
def packer_tpl = ["qemu-ubuntu-bionic", "qemu-ubuntu-xenial", "qemu-ubuntu-trusty"]
def http_proxy = "http://10.1.0.14:3128"

pipeline {
  agent any

  environment {
    TMPDIR = "./tmp"
    HTTP_PROXY = "${http_proxy}"
    HTTPS_PROXY = "${http_proxy}"
  }

  stages {
    stage("Packer build"){
      steps {
        sh "mkdir ${TMPDIR} 2>/dev/null || true"

        script {
          for (int i = 0; i < packer_tpl.size(); ++i) {
            sh "packer build ${packer_tpl[i]}.json"
          }
        }
      }

      post {
        failure {
          script {
            sh "rm -rf packer-artifacts/*"
            error "Packer build failed"
          }
        }
      }
    }

    stage("Upload packer images"){
      steps {
        sh "mkdir ${packer_dir} 2>/dev/null || true"
        sh "rsync -av packer-artifacts/*.raw ${packer_dir}/"
      }
    }
  }
}
