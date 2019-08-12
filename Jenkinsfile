pipeline {
  agent any

  stages {
    stage('bionic'){
      steps {
        bash '''#!/usr/bin/env bash
          set -eu -o pipefail
          TMPDIR=./tmp packer build qemu-ubuntu-bionic.json
        '''
      }
    }
  }
}
