job('DockerJenkinsIntegrationDsl') {
    description('Build and Publish docker-jenkins-integration-demo using dsl file')
    
    scm {
        git {
        remote {
                url('https://github.com/BaruchiHalamish20/docker-jenkins-integration-demo.git')
                credentials('')
            }
            wrappers {
                preBuildCleanup()
            } 
            branch('*/' + 'master')
        }
    }

    steps {
        // maven('install', 'pom.xml')
        maven {
           //goals('clean')
           // goals('verify')
            goals('install')
            mavenOpts('-Xms256m')
            mavenOpts('-Xmx512m')
            localRepository(LocalRepositoryLocation.LOCAL_TO_WORKSPACE)
            properties(skipTests: true)
            mavenInstallation('Maven 3.1.1')
        }
        dockerBuildAndPublish {
            repositoryName('bhalamish100/docker-jenkins-integration-demo-dsl')
            tag('${GIT_REVISION,length=7}')
            registryCredentials('dockerhubc')
            forcePull(false)
            createFingerprints(false)
            skipDecorate()
        }
        shell('docker network inspect elbit_network >/dev/null 2>&1 || docker network create --driver=bridge --subnet=172.28.0.0/16 --ip-range=172.28.5.0/24 --gateway=172.28.5.254 elbit_network')
        shell('docker run -itd --network=elbit_network bhalamish100/docker-jenkins-integration-demo-dsl')
    }
    
    triggers {
          upstream('docker-jenkins-integration-dsl', threshold = 'SUCCESS')
    }
  
}