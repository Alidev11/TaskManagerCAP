using OperationsService as service from '../../srv/operations-service';

// This enables the create/edit button
annotate service.Projects with @(
    odata.draft.enabled,
    UI.HeaderInfo : {
        TypeName : 'Project',
        TypeNamePlural : 'Projects',
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : status,
        },
        ImageUrl : name,
        Initials : name,
        TypeImageUrl : 'sap-icon://workflow-tasks',
    },
);
annotate service.Employees with @odata.draft.enabled;


// ================ Projects annotations ====================
annotate service.Projects with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
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
            {
                $Type : 'UI.DataField',
                Label : 'Manager',
                Value : manager_ID,
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
            Label : 'Name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Status',
            Value : status,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Manager',
            Value : manager_ID,
        }
    ],
    
);

annotate service.Projects with {
    manager @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Employees',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : manager,
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
        },
        Common.ExternalID : manager.last_name,
    )
};

// ================ Tasks annotations ====================
annotate service.Tasks with @(
    UI.FieldGroup #TasksGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Status',
                Value : status,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Assignee',
                Value : assignee_ID,
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
    ],
    UI.LineItem: [
        { Value: title, Label: 'Title' },
        { Value: description, Label: 'Description' },
        { Value: status, Label: 'Status' },
        { Value: assignee_ID, Label: 'Assignee' },
    ],
    UI.LineItem #Tasks : [
        { Value: title, Label: 'Task Name' },
        { Value: status, Label: 'Status' },
        { Value: assignee_ID, Label: 'Assignee' },
    ],
    UI.HeaderInfo : {
        TypeName : 'Task',
        TypeNamePlural : 'Tasks',
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : description,
        },
        ImageUrl : title,
        Initials : title,
        TypeImageUrl : 'sap-icon://task',
    },
);

// ================ Employees annotations ====================
annotate service.Employees with @(
    UI.LineItem: [
        { Value: first_name, Label: 'First Name' },
        { Value: last_name, Label: 'Last Name' },
        { Value: email, Label: 'Email' },
        { Value: role, Label: 'Role' },
    ],
);

annotate service.Tasks with {
    assignee @(
        // 1. Text Configuration: Show the Name, not the UUID
        Common.Text : assignee.last_name, 
        Common.TextArrangement : #TextFirst, // Shows "Smith (ID)"

        // 2. The Value Help (Dropdown/Popup logic)
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Employees', // The table to look up
            Parameters : [
                // 'InOut' maps the selected ID back to your Task's assignee_ID field
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : assignee_ID, 
                    ValueListProperty : 'ID'
                },
                // Display these columns in the popup list
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'first_name',
                    Label : 'First Name'
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'last_name',
                    Label : 'Last Name'
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'role',
                    Label : 'Role'
                }
            ]
        }
    );
};
annotate service.Employees with {
    email @(
        Common.Text : role,
        Common.Text.@UI.TextArrangement : #TextFirst,
)};

