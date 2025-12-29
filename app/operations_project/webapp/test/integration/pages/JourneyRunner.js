sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"operationsproject/test/integration/pages/ProjectsList",
	"operationsproject/test/integration/pages/ProjectsObjectPage",
	"operationsproject/test/integration/pages/TasksObjectPage"
], function (JourneyRunner, ProjectsList, ProjectsObjectPage, TasksObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('operationsproject') + '/test/flp.html#app-preview',
        pages: {
			onTheProjectsList: ProjectsList,
			onTheProjectsObjectPage: ProjectsObjectPage,
			onTheTasksObjectPage: TasksObjectPage
        },
        async: true
    });

    return runner;
});

