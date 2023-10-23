# WORDPRESS Application in Azure
# Brought to you by Stephen, LeRon, Luke, and Kyle! 
# code name: SiLLK

We are creating a Main directory to house all of our Terraform changes.

created a variable for "location" and "resource group name", so we don't have to constantly do the "azurerm_rg_group.stuff.moreStuff" way of going about things.
var.location will default as "East US", and var.rg_name will put our "SiLLK" label on things.

if you find that there are additional things that end up being repeated, please feel free to add into variables.

missing pieces (please note comments):
azureFrontDoor.tf
vmscaleset.tf
WAFpolicy.tf - this is firewall, do not connect, unless you want to see every1 get emailed about budgets.
