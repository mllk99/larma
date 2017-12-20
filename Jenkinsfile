@Library('workshop') _

node ('R&&lars'){
     
    stage ('Preparation') {
        git credentialsId: '23d398e3-c473-4e62-b507-ad04f2952f50', url: 'git@github.com:mllk99/larma.git'
        //sh "git clone git@github.com:mllk99/jenkins-workshop.git"
    }
    
    stage('Build') {
        //sh 'docker container run -i --name  rproject -v "$PWD":/usr/src/r-base -w /usr/src/r-base model.R"'
        
        sh 'docker container run --rm -i --name  r-project -v "$PWD":/usr/src/r-base -w /usr/src/r-base r-base Rscript model.R'
          echo 'Vi arkiverer model objektet'
          sh 'pwd'
          sh 'ls -la'
          echo "object name"
          echo "model_${env.BUILD_TAG}.rda"
          //sh "mv model.rda model.rda"
          //sh "mv model.rda model_${env.BUILD_TAG}.rda"
          echo "model_${env.BUILD_TAG}.rda"
          // stash flytter den op på en hylde (holder på den)
          //stash includes: "model_${env.BUILD_TAG}.rda", name: 'larma_model'
        stash includes: "model.rda", name: 'larma_model'
    }

node ('R&&manja'){
    
    sh 'ls -la'
    
    unstash "larma_model"
    sh 'pwd'
    sh 'ls -la'
    
    sh 'docker container run --rm -i --name  r-project -v "$PWD":/usr/src/r-base -w /usr/src/r-base r-base Rscript -e "print(quote(larma_model))"'
    sh 'docker container run --rm -i --name  r-project -v "$PWD":/usr/src/r-base -w /usr/src/r-base r-base Rscript -e "load(\'model.rda\');print(model)"'
    //docker container run --rm -i --name  r_project -v "$PWD":/usr/src/r-base -w /usr/src/r-base r-base Rscript -e "load('model.rda');print(model)"   
    
}
}
