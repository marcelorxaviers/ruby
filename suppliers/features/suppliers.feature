Feature: Supply me
    In order to get supplies
    A supplier
    Should give its contact updated
 
    Scenario: Create a supplier contact
        Given I am on the new_supplier page
        And I fill in "supplier_name" with "Marcelo"
        And I fill in "supplier_email" with "marcelo@suppliers.com"
        And I fill in "supplier_site" with "http://suppliers.com"
        And I fill in "supplier_phone" with "554888439879"
        When I press "Create Supplier"
        Then page should have notice message "Supplier was successfully created."