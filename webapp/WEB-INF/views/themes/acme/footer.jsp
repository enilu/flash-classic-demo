<%@ page import="org.joda.time.DateTime" %>
<%@ taglib prefix="z" uri="/WEB-INF/webflash.tld"%>
      <!-- end: Content -->
      </div><!--/#content.span10-->
    </div><!--/fluid-row-->
    
    <div class="clearfix"></div>
    <footer>
      <p>
        <span style="text-align:left;float:left">&copy; <a href="#" target="_blank">Z</a> <%= DateTime.now().getYear() %></span>
        <z:img src="/images/about_logo.png" alt="logo"/>
      </p>
    </footer>

<!-- start: JavaScript-->
<z:script path="/assets/underscore.js"/>

<!--[if !IE]>-->
<script src="/themes/acme/js/jquery-2.1.0.min.js"></script>
<!--<![endif]-->

<!--[if IE]>
<script src="/themes/acme/js/jquery-1.11.0.min.js"></script>
<![endif]-->

<script src="/themes/acme/js/jquery-migrate-1.2.1.min.js"></script>
<script src="/themes/acme/js/bootstrap.min.js"></script>


<!-- page scripts -->
<script src="/themes/acme/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="/themes/acme/js/jquery.sparkline.min.js"></script>
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="/themes/acme/js/excanvas.min.js"></script><![endif]-->
<script src="/themes/acme/js/jquery.flot.min.js"></script>
<script src="/themes/acme/js/jquery.flot.pie.min.js"></script>
<script src="/themes/acme/js/jquery.flot.stack.min.js"></script>
<script src="/themes/acme/js/jquery.flot.resize.min.js"></script>
<script src="/themes/acme/js/jquery.flot.time.min.js"></script>
<script src="/themes/acme/js/raphael.min.js"></script>
<script src="/themes/acme/js/justgage.1.0.1.min.js"></script>

<!-- theme scripts -->
<script src="/themes/acme/js/custom.min.js"></script>
<script src="/themes/acme/js/core.min.js"></script>


<z:script path="/assets/select2.js"/>
<z:script path="/assets/jquery-ujs.js"/>

<z:script path="/assets/noty/jquery.noty.js"/>
<z:script path="/assets/noty/layouts/top.js"/>
<z:script path="/assets/noty/themes/default.js"/>
<z:script path="/assets/jquery.form.js"/>
<z:script path="/assets/jquery.validate.js"/>
<z:script path="/assets/jquery.validate.zh.js"/>

<z:script path="/assets/custom.js"/>
<z:script path="/assets/application.js"/>
<!-- end: JavaScript-->

</div><!--/.fluid-container-->
  </body>
</html>
