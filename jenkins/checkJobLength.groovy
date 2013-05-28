/*
	This script can be copied and pasted into the groovy window in a jenkins build step.  
	Really handy for getting notified when a job is taking longer than it should
*/

def jobList = hudson.model.Hudson.instance.items.findAll{job -> job.isBuildable() && job.building} 
jobList.each {job ->
    def startDate = job.lastBuild.timestamp.time
    def started = startDate.time
    println "job [${job.name}] started at ${startDate}"
    def now = new Date().time
    def oneDay = 1000 * 60 * 60 * 24
    if(now - started > oneDay) {
        throw new RuntimeException("job [${job.name}] has run longer than a day")
    }
    println "job [${job.name}] has been running for less than a day, we are all good"
}
