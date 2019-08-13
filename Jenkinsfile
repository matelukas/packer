pipeline {
  agent any

  stages {
    stage('bionic'){
      steps {
        sh '''#!/bin/bash
          set -eu -o pipefail
          mkdir tmp || true
          PACKER_LOG=1 TMPDIR=./tmp packer build qemu-ubuntu-bionic.json
        '''
      }
    }
  }
}
