using { managed } from '@sap/cds/common';

namespace sap.capire.SmartOperationHub;

// ------------------------------------ ENTITIES ------------------------------

entity Employees : managed {
    key ID : UUID;
    first_name : String;
    last_name : String;
    email : String;
    role : Role default 'EMPLOYEE';
}

entity Projects : managed {
    key ID : UUID;
    name : String;
    status : ProjectStatus;
    manager : Association to one Employees; 
    tasks : Composition of many Tasks on tasks.project = $self;
}

entity Tasks : managed {
    key ID : UUID;
    title : String;
    description : String(111);
    status : TaskStatus;
    project : Association to one Projects not null;
    assignee : Association to one Employees not null;
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