def packer_dir = "/mnt/nfs/packer"
def packer_tpl = ["qemu-ubuntu-bionic", "qemu-ubuntu-xenial", "qemu-ubuntu-trusty"]
def http_proxy = "http://10.1.0.14:3128"

def parse_json(json) {
  return new groovy.json.JsonSlurper().parseText(json)
}

def list_artifacts() {
  def manifests = findFiles(glob: "packer-artifacts/*.manifest")
  
  for(int i = 0; i < manifests.size(); i++) {
    echo "${manifests[i].name}"
  }

//  def manifest_data = readFile manifest
//  def manifest_json = parse_json(manifest_data)
//  echo manifest_json.builds.files
}

def cleanup_artifacts() {
  sh "rm -rf packer-artifacts/*"
}

@NonCPS // has to be NonCPS or the build breaks on the call to .each
def list_packer_tpls(list) {
    list.each { item ->
        echo "${item}"
    }
}

pipeline {
  agent any

  environment {
    TMPDIR = "./tmp"
    HTTP_PROXY = "${http_proxy}"
    HTTPS_PROXY = "${http_proxy}"
  }

  stages {
    stage("List packer templates") {
      steps {
        list_packer_tpls(packer_tpl)
      }
    }

    stage("Packer build") {
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
          steps {
            cleanup_artifacts
          }
        }
        success {
          steps {
            list_artifacts
          }
        }
      }
    }

    stage("Upload packer images") {
      steps {
        sh "mkdir ${packer_dir} 2>/dev/null || true"
        sh "rsync -av packer-artifacts/*.raw ${packer_dir}/"
      }
    }
  }
}
