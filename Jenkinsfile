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
    }
    
    triggers {
          upstream('docker-jenkins-integration-dsl', threshold = 'SUCCESS')
    }
}