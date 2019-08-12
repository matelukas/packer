pipeline {
  agent any

  stages {
    stage('bionic'){
      steps {
        sh '''#!/bin/bash
          set -eu -o pipefail
          TMPDIR=./tmp packer build qemu-ubuntu-bionic.json
        '''
      }
    }
  }
}
