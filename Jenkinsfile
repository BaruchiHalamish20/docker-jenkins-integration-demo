job('DockerJenkinsIntegrationDsl') {
    description('Build and Publish docker-jenkins-integration-demo using dsl file')
    
    environment {
       dockerhub = credentials('dockerhubc')
       dockerImage = ''
    }
    
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
        dockerBuildAndPublish {
            repositoryName('bhalamish100/docker-jenkins-integration-demo-dsl')
            registryCredentials('dckr_pat_40Iz2GcwCtW6-G5s_MCEDMbkW-k')
        }
    }
}