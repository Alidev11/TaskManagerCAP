using { managed, cuid } from '@sap/cds/common';

namespace sap.capire.SmartOperationHub;

// ------------------------------------ ENTITIES ------------------------------

entity Employees : managed, cuid {
    first_name : String;
    last_name : String;
    email : String;
    role : Role default 'EMPLOYEE';
    project : Association to many Projects
}

entity Projects : managed, cuid {
    name : String;
    status : ProjectStatus;
    manager : Association to one Employees; 
    tasks : Composition of many Tasks on tasks.project = $self;
}

entity Tasks : managed, cuid {
    key project : Association to one Projects not null;
    title : String;
    description : String(255);
    status : TaskStatus;
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