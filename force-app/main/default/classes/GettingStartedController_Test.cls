@isTest
private class GettingStartedController_Test {
    private static testmethod void testGettingStarted()
    {
        List<Survey__c> surveys = [SELECT Id, Name From Survey__c WHERE Name='SurveyForce Sample Survey'];
        System.assertEquals(surveys.size(), 0   );

        GettingStartedController gsc = new GettingStartedController();
        gsc.makeTestSurvey();

        List<Survey__c> listSurvey = [SELECT Id, Name From Survey__c WHERE Name = 'SurveyForce Sample Survey' LIMIT 1];
        System.assertEquals(listSurvey.size(), 1);

        String surveyUrl = '/apex/surveymanagerpage?id=' + gsc.testSurvey.Id;
        System.assertEquals(surveyUrl, gsc.ViewSurvey().getUrl());

        surveyUrl = '/apex/takesurvey?caId=none&cId=none&id=' + gsc.testSurvey.Id;
        System.assertEquals(surveyUrl, gsc.takeSurvey().getUrl());

    }
}