def jobList = hudson.model.Hudson.instance.items.findAll{job -> job instanceof hudson.model.Job && job.isBuildable() && job.name != "testFailureCount"} 
int failureCount = 5
jobList.each {job ->
    
    int count = failureCount
    def lastBuild = job.lastBuild
    boolean failure = true
    Date startTime = new Date(lastBuild.startTimeInMillis)
    println "testing job [$job.name] with most recent build at [$startTime]"
    while (count > 0 && lastBuild) {
        if(lastBuild.result == hudson.model.Result.SUCCESS) {
            failure = false
        }
        else {
            println "job [$job.name] had a failure at [$startTime]"
        }

        count--
        lastBuild = lastBuild.previousBuild    
    }
    assert !failure : "job [$job.name] has had at least 5 failures"
    println "job [$job.name] is fine"    
}

return "all jobs are working under normal constraints"
