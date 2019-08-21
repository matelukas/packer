pipeline {
  agent any

  environment {
    TMPDIR = "./tmp"
  }

  def packer_dir = "/mnt/nfs/packer"
  def packer_tpl = ["qemu-ubuntu-bionic.json", "qemu-ubuntu-xenial.json", "qemu-ubuntu-trusty.json"]

  stages {
    stage('Packer build'){
      steps {
        sh "mkdir tmp &>/dev/null || true"

        script {
          for (int i = 0; i < packer_tpl.size(); ++i) {
            sh "packer build ${packer_tpl[i]}"
          }
        }
      }

      post {
        success {
          echo "${packer_dir}"
        }
      }
    }
  }
}
