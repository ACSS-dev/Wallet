<main class="tab-pane active"
      ng-if="globalService.currentTab==globalService.tabs.offlineTransaction.id"
      ng-controller='offlineTxCtrl'
      ng-cloak>

  	@@include( './offlineTx-1.tpl',     { "site": "mew" } ) 

   @@include( './offlineTx-2.tpl',     { "site": "mew" } )

   @@include( './offlineTx-3.tpl',     { "site": "mew" } ) 

   @@include( './offlineTx-modal.tpl', { "site": "mew" } ) 

</main>
