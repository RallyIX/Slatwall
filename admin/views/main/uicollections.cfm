<div class="panel panel-default" ng-app="collections">
  <div class="panel-heading">
    <h3 class="panel-title">Order Listing</h3>
  </div>
  <div class="panel-body">

    <div class="row content-nav">
      <div class="col-md-12 align-right">

        <form class="navbar-form search-bar no-padding" role="search">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">
            <div class="input-group-btn">
              <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>
            </div>
          </div>
        </form>

        <button type="button" class="btn btn-default content-nav-button"><span class="glyphicon glyphicon-plus"></span></button>
        <button type="button" class="btn btn-default content-nav-button" data-toggle="collapse" data-target="#option-select"><span class="glyphicon glyphicon-cog"></span></button>




        <div id="option-select" class="collapse align-left">

          <div class="panel-group" id="accordion">
            <div class="panel panel-default">
              <div class="panel-heading" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                <h4 class="panel-title">
                    Properties
                </h4>
              </div>
              <div id="collapseOne" class="panel-collapse collapse in">
                <div class="panel-body">
                  Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                </div>
              </div>
            </div>
            <div class="panel panel-default">
              <div class="panel-heading" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                <h4 class="panel-title">
                    Filters
                </h4>
              </div>
              <div id="collapseTwo" class="panel-collapse collapse">
                <div class="panel-body">
                  Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                </div>
              </div>
            </div>
            <div class="panel panel-default">
              <div class="panel-heading" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                <h4 class="panel-title">
                    Display Options
                </h4>
              </div>
              <div id="collapseThree" class="panel-collapse collapse">
                <div class="panel-body">
                  Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                </div>
              </div>
            </div>
          </div>
        </div>

        <!--- Drop down option you can delete if you don't need--->
        <!--- <div class="btn-group">
          <button type="button" class="btn btn-default dropdown-toggle content-nav-button" data-toggle="dropdown">
            <span class="glyphicon glyphicon-cog"></span>
          </button>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Properties</a></li>
            <li><a href="#">Filters</a></li>
            <li><a href="#">Display Options</a></li>
          </ul>
        </div> --->

      </div>
    </div>

    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>Row</span></th>
                <th class="sortable">ID</th>
                <th class="sortable">Company</th>
                <th class="sortable">First Name</th>
                <th class="sortable">Last Name</th>
                <th class="sortable">Type</th>
                <th class="sortable">Status</th>
                <th class="sortable">Origin</th>
                <th class="sortable">Created</th>
                <th class="sortable">Date Placed</th>
                <th class="sortable">Total</th>
                <th>View</th>
            </tr>
        </thead>
        <tbody>

          <!---TR 1--->
          <tr class="even-tr">
            <td><div class="checkbox"><input type="checkbox" id="checkbox1"><label for="checkbox"></label></div></td>
            <td>2691402</td>
            <td>Ten24</td>
            <td>James</td>
            <td>Earl</td>
            <td>Sales Order</td>
            <td>New</td>
            <td>West</td>
            <td>Jun 06, 2014 05:36 PM</td>
            <td>Jun 06, 2014 05:43 PM</td>
            <td>$183.90</td>
            <td class="view-element" data-toggle="collapse" data-target="#info-option1"></td>
          </tr>
          <tr id="info-option1" class="collapse">
            <td class="details" colspan="12">
              <table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">
                <tbody>
                  <tr>
                    <td>

                      <ul>
                        <li>Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</li>
                        <li>Maecenas sed diam eget risus varius blandit sit amet non magna.</li>
                        <li>Maecenas sed diam eget risus varius blandit sit amet non magna.</li>
                      </ul>
                    </td>
                  </tr>
                </tbody>
              </table>
            </td>
          </tr>

        </tbody>
    </table>


    <div class="row">
      <div class="col-md-12 align-right">
        <ul class="pagination pagination-sm">
          <li><a href="#">&laquo;</a></li>
          <li><a href="#">1</a></li>
          <li><a href="#">2</a></li>
          <li><a href="#">3</a></li>
          <li><a href="#">4</a></li>
          <li><a href="#">5</a></li>
          <li><a href="#">&raquo;</a></li>
        </ul>
      </div>
    </div>

  </div>
</div>

<style>

  body {font-family: 'Open Sans', sans-serif;color:#767676;}
  th {font-weight:600;}

  .view-element {text-align:center;cursor:pointer;-webkit-touch-callout: none;-webkit-user-select: none;-khtml-user-select: none;-moz-user-select: none;-ms-user-select: none;user-select: none;}
  .view-element:hover {background-color:#f58620 !important;border-color:#f58620 !important;color:#fff;}
  .view-element:after{font-family:'Glyphicons Halflings';content:"\e105";}

  .no-padding {padding:0px !important;}
  .align-right {text-align:right;}
  .align-left {text-align:left;}
  .content-nav-button {display:inline-block;}
  .content-nav button.content-nav-button {margin-top:8px;margin-bottom:8px;}
  .search-bar {display:inline-block;}
  .hiddenRow {padding: 0 !important;}


  /*CHECK BOX STYLES START*/
  .checkbox {text-align:center;}
  .checkbox {margin:0px;}
  .checkbox label {padding-left: 0px;margin-top:2px;}
  .checkbox label{display:inline-block;position:relative;}
  .checkbox label:before{content:"";display:inline-block;width:15px;height:15px;border:1px solid #cccccc;border-radius:3px;background-color:#fff;-webkit-transition:border 0.15s ease-in-out, color 0.15s ease-in-out;transition:border 0.15s ease-in-out, color 0.15s ease-in-out;vertical-align:text-top;}
  .checkbox label:after{display:inline-block;position:absolute;width:16px;height:16px;left:0;top:0;padding-right:1px;padding-top:2px;font-size:9px;color:#555555;vertical-align:text-top;}
  @-moz-document url-prefix() {.checkbox label:after {padding-top:3px;}}
  .checkbox input[type=checkbox]{display:none;}
  .checkbox input[type=checkbox]:checked + label:after{font-family:'Glyphicons Halflings';content:"\e013";}
  .checkbox input[type=checkbox]:disabled + label{opacity:0.65;}
  .checkbox input[type=checkbox]:disabled + label:before{background-color:#eeeeee;cursor:not-allowed;}
  /*CHECK BOX STYLES END*/

  /*Bootstrap overwrite*/
  .btn:focus {outline: none;}
  .panel, .panel-group .panel {border-radius:0px;}
  .panel-default>.panel-heading, .panel-default {border-color: #eee;}
  #accordion .panel-default>.panel-heading {cursor: pointer;}
  .panel-group .panel-heading+.panel-collapse>.panel-body {border-top: none;}
  .panel-heading {border-top-left-radius: 0px;border-top-right-radius: 0px}
  .table>thead>tr>th, .table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td, .table>tbody>tr>td, .table>tfoot>tr>td {padding: 8px 8px 5px 8px;}
  .table-bordered>thead>tr>th, .table-bordered>thead>tr>td {border-bottom-width:1px;}
  .btn-default {color:#767676;}
  .content-nav .dropdown-menu {left:auto;right:0;top:88%;border-radius:0px;}
  .content-nav .dropdown-menu {background-color:#F9F9F9;}
  .dropdown-menu li.active > a:hover, .dropdown-menu li > a:hover {background-color: #FC770D;background-image: -moz-linear-gradient(top, #f58620, #f58620);background-image: -ms-linear-gradient(top, #f58620, #f58620);background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#f58620), to(#f58620));background-image: -webkit-linear-gradient(top, #f58620, #f58620);background-image: -o-linear-gradient(top, #f58620, #f58620);background-image: linear-gradient(top, #f58620, #f58620);color: #FFF !important;}
  .pagination>li>a:hover, .pagination>li>span:hover, .pagination>li>a:focus, .pagination>li>span:focus {background-color:#f58620;color:#ffffff;border-color:#f58620;}
  .btn-default:hover, .btn-default:focus, .btn-default:active, .btn-default.active, .open>.dropdown-toggle.btn-default {background-color:#f58620;color:#ffffff;border-color: #f58620;}


  table tr th.sortable:after {font-family:'Glyphicons Halflings';content: "\e119";float:right;font-size:10px;margin-top:3px;cursor: pointer;color:#ccc;}
  table tr th .glyphicon {vertical-align:text-top;}

  .pagination {margin:0px;}
  .pagination>li>a, .pagination>li>span {color:#767676;}

</style>

<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,800,700' rel='stylesheet' type='text/css'>
