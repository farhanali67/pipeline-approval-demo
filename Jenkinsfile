// JenkinsfileV3.2.0-g
@Library('jenkins-shared-library') _

if (params.Namespace) {
    sharedEksPipeline()
}

if (params.region_oci) {
    sharedPipelineOCI()
}

if (params.app_contexts) {
    sharedPipelineECS()
}

if (!params.Namespace && !params.region_oci && !params.app_contexts) {
    sharedPipeline()
}
