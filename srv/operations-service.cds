using {sap.capire.SmartOperationHub as db} from '../db/schema';

service OperationsService {
    entity Employees as projection on db.Employees;
    entity Projects as projection on db.Projects;
    entity Tasks as projection on db.Tasks;
}