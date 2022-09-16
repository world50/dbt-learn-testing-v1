with sf_contact as(
select 
    person_account_case_safe_id__c as sf_contact_id, 
    name
from RAW_DATALAKE.SALESFORCE_PROD.CONTACT
)
select *
from sf_contact

