using { managed } from '@sap/cds/common';

namespace sap.capire.SmartOperationHub;

// ------------------------------------ ENTITIES ------------------------------

entity Employees : managed {
    key ID : UUID;
    name : String;
    email : String;
    role : Role default 'EMPLOYEE';
}

entity Projects : managed {
    key ID : UUID;
    name : String;
    status : ProjectStatus;
    manager : Association to Employees;
}

entity Tasks : managed {
    key ID : UUID;
    title : String;
    status : TaskStatus;
    project : Association to Projects;
    assignee : Association to many Employees;
}

// ------------------------------------ ENUMS and TYPES ----------------------------

type Role : String enum {
    EMPLOYEE;
    MANAGER;
    ADMIN;
}

type TaskStatus : String enum {
    TODO;
    IN_PROGRESS;
    DONE;
};

type ProjectStatus : String enum {
    PLANNED;
    IN_PROGRESS;
    COMPLETED;
    CLOSED;
}