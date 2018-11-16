<!DOCTYPE html>
<html lang="en" ng-app="mewApp">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Foton Wallet</title>
<meta property="og:title" content="MyEtherWallet.com: Your Key to Ethereum">
<meta property="og:site_name" content="MyEtherWallet.com: Your Key to Ethereum">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700&subset=cyrillic">

<link rel="stylesheet" href="css/etherwallet-master.min.css?lm11112018">

<script type="text/javascript" src="js/etherwallet-static.min.js?lm11112018"></script>
<script type="text/javascript" src="js/etherwallet-master.js?lm11112018"></script>
<meta name="description" content="">
<meta property="og:description"  content="">
<meta name="twitter:description" content="">
<meta name="robots" content="index,follow">
<meta name="googlebot" content="index,follow">
<meta name="google-site-verification" content="IpChQ00NYUQuNs_7Xs6xlnSdzalOlTUYbBsr8f7OpvM" />
<link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png">
<link rel="manifest" href="site.webmanifest">
<link rel="mask-icon" href="safari-pinned-tab.svg" color="#5bbad5">
<meta name="apple-mobile-web-app-title" content="Foton Wallet">
<meta name="application-name" content="Foton Wallet">
<meta name="msapplication-TileColor" content="#da532c">
<meta name="theme-color" content="#ffffff">
<script type="application/ld+json">
{
"@context": "http://schema.org",
"@type" : "Organization",
"name" : "MyEtherWallet",
"legalName" : "MyEtherWallet Inc",
"url" : "https://www.myetherwallet.com/",
"contactPoint" : [{
  "@type" : "ContactPoint",
  "email" : "support@myetherwallet.com",
  "url"   : "https://myetherwallet.com",
  "contactType" : "customer service"
}],
"logo" : "https://www.myetherwallet.com/images/myetherwallet-logo.png",
"description": "MyEtherWallet.com is a free, open-source, client-side interface for generating Ethereum wallets &amp; more. Interact with the Ethereum blockchain easily &amp; securely.",
"sameAs" : [
  "https://www.myetherwallet.com/",
  "https://chrome.google.com/webstore/detail/myetherwallet-cx/nlbmnnijcnlegkjjpcfjclmcfggfefdm",
  "https://www.facebook.com/MyEtherWallet/",
  "https://twitter.com/myetherwallet",
  "https://medium.com/@myetherwallet",
  "https://kb.myetherwallet.com/",
  "https://github.com/kvhnuke/etherwallet",
  "https://github.com/MyEtherWallet",
  "https://kvhnuke.github.io/etherwallet/","https://myetherwallet.slack.com/"
]
}
</script>
</head>
<body>

<header class="{{curNode.name}} {{curNode.service}} {{curNode.service}} nav-index-{{gService.currentTab}}" aria-label="header" ng-controller='tabsCtrl' >
	<div class="page-header">
<section class="header-branding container">
      <a class="brand" href="." aria-label="Go to homepage">
        <img src="images/foton-logo.svg"   height="40" width="140" alt="Foton" />
        
      </a>
    <div class="select-header">
	<div class="page-header__language-and-mini-logo">
		<div style="display: flex; align-items: center;">
	    <p class="small version">3.25.0</p>
		    <span class="dropdown dropdown-lang" ng-cloak>
		      <a tabindex="0"  aria-haspopup="true" aria-expanded="false" aria-label="change language. current language {{curLang}}" class="dropdown-toggle" ng-click="dropdown = !dropdown">{{curLang}}<i class="caret"></i></a>
		      <ul class="dropdown-menu" ng-show="dropdown">
		        <li><a ng-class="{true:'active'}[curLang=='English']"         ng-click="changeLanguage('en','English'        )"> English         </a></li>
		      </ul>
		    </span>
		</div>
		<img src="images/logo-mini.svg" alt="logo mini" width="25" height="25" style="margin-left: 15px;">
	</div>
    <span class="dropdown dropdown-gas" ng-cloak>
      <a tabindex="0" aria-haspopup="true" aria-label="adjust gas price" class="dropdown-toggle btn-white" ng-click="dropdownGasPrice = !dropdownGasPrice" click-out="dropdownGasPrice = false">
        <span translate="OFFLINE_Step2_Label_3">Gas Price</span>:
          {{gas.value}} Gwei
          <i class="caret"></i>
      </a>
      <ul class="dropdown-menu" ng-show="dropdownGasPrice">
        <div class="header--gas">
          <span translate="OFFLINE_Step2_Label_3">Gas Price</span>:
          {{gas.value}} Gwei
          <input type="range" ng-model="gas.value" min="{{gas.min}}" max="{{gas.max}}" step="{{gas.step}}" ng-change="gasChanged()"/>
          <p class="small col-xs-4 text-left"> <!--translate="GAS_Price_1"-->
            Really, really slow
          </p>
          <p class="small col-xs-4 text-center"> <!--translate="GAS_Price_2"-->
            Maybe Fast?
          </p>
          <p class="small col-xs-4 text-right"> <!--translate="GAS_Price_3"-->
            Fast
          </p>
          <br />
          <p class="small" style="white-space:normal;font-weight:300;margin: 2rem 0 0;" translate="GAS_PRICE_Desc"></p>
          <a class="small"
             translate="x_ReadMore"
             href="https://kb.myetherwallet.com/gas/what-is-gas-ethereum.html"
             target="_blank"
             rel="noopener noreferrer"></a>
        </div>
      </ul>
    </span>

    <!-- Warning: The separators you see on the frontend are in styles/etherwallet-custom.less. If you add / change a node, you have to adjust these. Ping tayvano if you're not a CSS wizard -->
    <span class="dropdown dropdown-node" ng-cloak>
      <a tabindex="0"
         aria-haspopup="true"
         aria-label="change node. current node {{curNode.name}} node by {{curNode.service}}"
         class="dropdown-toggle btn-white"
         ng-click="dropdownNode = !dropdownNode"
         ng-attr-title="{{curNode.name}} ({{curNode.service}})"
         click-out="dropdownNode = false">
           <span translate="X_Network">Network:</span>
           {{curNode.name}}
           <small>({{curNode.service}})</small>
           <i class="caret"></i>
      </a>
      <ul class="dropdown-menu" ng-show="dropdownNode">
        <li ng-repeat="(key, value) in nodeList">
          <a ng-class="{true:'active'}[curNode == key]" ng-attr-title="{{value.name}} ({{value.service}})" ng-click="changeNode(key)">
            {{value.name}}
            <small> ({{value.service}}) </small>
            <img ng-show="value.service=='Custom'" src="images/icon-remove.svg" class="node-remove" title="Remove Custom Node" ng-click="removeNodeFromLocal(value.name)"/>
          </a>
        </li>
        <li>
          <a ng-click="customNodeModal.open(); dropdownNode = !dropdownNode;" translate="X_Network_Custom">
            Add Custom Network / Node
          </a>
        </li>
      </ul>
    </span>

    </div>
</section>
</div>

<nav role="navigation" aria-label="main navigation" class="container nav-container overflowing page-main__main-navigation">
	<div class="nav-scroll">
		
	
    <ul class="main-navigation nav-inner">
      <li ng-repeat="tab in tabNames track by $index" \
          class="nav-item {{tab.name}}" \
          ng-show="tab.mew"
          ng-class="{'activ-link': $index==gService.currentTab}"
          ng-click="tabClick($index)">
            <a tabindex="0" aria-label="nav item: {{tab.name | translate}}" translate="{{tab.name}}"></a>
      </li>
      <li class="nav-item" ng-show="MEWconnectActive" ng-cloak>
        <div style="margin-left: 20px;">
          <div ng-show="MEWconnectState == 0" style="border-bottom: solid 2px #929292">
            <h4 ><img src="images/MEWconnectLogo.svg" width="120" height="26"> Not Connected</h4>
          </div>
          <div ng-show="MEWconnectState == 1" style="border-bottom: solid 2px #1995be">
            <h4><img src="images/MEWconnectLogo.svg" width="120" height="26" style="margin-right: 10px">Preparing Connection</h4>
          </div>
          <div ng-show="MEWconnectState == 2" style="border-bottom: solid 2px #23aeb2">
            <h4 ><img src="images/MEWconnectLogo.svg" width="120" height="26"> Connected</h4>
          </div>
          <div ng-show="MEWconnectState == 3" style="border-bottom: solid 2px #febe1a">
            <h4><img src="images/MEWconnectLogo.svg" width="120" height="26"> Timed Out</h4>
          </div>
          <div ng-show="MEWconnectState == 4" style="border-bottom: solid 2px #e74d41">
            <h4><img src="images/MEWconnectLogo.svg" width="120" height="26"> Disconnected</h4>
          </div>
        </div>
      </li>
    </ul>
    </div>
  </div>
  <a aria-hidden="true"
     ng-show="showRightArrow"
     class="nav-arrow-right"
     ng-click="scrollRight(100);"
     ng-mouseover="scrollHoverIn(false,2);"
     ng-mouseleave="scrollHoverOut()">&#187;</a>
</nav>
@@if (site === 'mew' ) { @@include( './header-node-modal.tpl', { "site": "mew" } ) }
@@if (site === 'cx'  ) { @@include( './header-node-modal.tpl', { "site": "cx"  } ) }

</header>
