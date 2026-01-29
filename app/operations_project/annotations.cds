using OperationsService as service from '../../srv/operations-service';

// This enables the create/edit button
annotate service.Projects with @odata.draft.enabled;
annotate service.Employees with @odata.draft.enabled;


// ================ Projects annotations ====================
annotate service.Projects with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'status',
                Value : status,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Tasks',
            ID : 'Tasks',
            Target : 'tasks/@UI.LineItem#Tasks',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'status',
            Value : status,
        }
    ],
    
);

annotate service.Projects with {
    manager @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Employees',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : manager_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'first_name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'last_name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'email',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'role',
            },
        ],
    }
};

// ================ Tasks annotations ====================
annotate service.Tasks with @(
    UI.FieldGroup #TasksGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'status',
                Value : status,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'TasksFieldGroup',
            Label : 'General Information',
            Target : '@UI.FieldGroup#TasksGroup',
        },
        // {
        //     $Type : 'UI.ReferenceFacet',
        //     Label : 'Employees',
        //     ID : 'Employees',
        //     Target : 'employees/@UI.LineItem#Employees',
        // },
    ],
    UI.LineItem: [
        { Value: title, Label: 'Task Name' },
        { Value: status, Label: 'Status' },
    ],
    UI.LineItem #Tasks : [
        { Value: title, Label: 'Task Name' },
        { Value: status, Label: 'Status' },
    ],
);

// ================ Employees annotations ====================
annotate service.Employees with @(
    UI.LineItem: [
        { Value: first_name, Label: 'First Name' },
        { Value: last_name, Label: 'Last Name' },
        { Value: email, Label: 'Email' },
        { Value: role, Label: 'Role' },
    ],
    // UI.LineItem #Employees : [
    //     { Value: first_name, Label: 'First Name' },
    //     { Value: last_name, Label: 'Last Name' },
    //     { Value: email, Label: 'Email' },
    //     { Value: role, Label: 'Role' },
    // ],
);