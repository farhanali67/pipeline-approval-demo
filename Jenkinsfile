// JenkinsfileV3.1.0-g
@Library('jenkins-shared-library@farhanali67-patch-7') _

if (params.Namespace) {
    sharedEksPipeline()
} else if (params.region_oci) {
    sharedPipelineOCI()
} else {
    sharedPipeline()
}
