pipeline {
  agent any

  stages {
    stage('bionic'){
      steps {
        sh '''#!/bin/bash
          mkdir tmp || true
          set -eu -o pipefail
          TMPDIR=./tmp packer build qemu-ubuntu-bionic.json
        '''
      }
    }
  }
}
