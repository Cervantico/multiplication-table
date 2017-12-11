<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="MultiplicationTable.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content="programming exercise"/>
    <meta name="author" content="Néstor Daza"/>

    <title>Multiplication table - Néstor Daza</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous"/>
    <link href="css/global.css" rel="stylesheet" />
</head>
<body id="page-top">
<form id="parameters" runat="server">

<div class="container">   
    
    <header class="masthead">
        <h3 class="text-muted">Multiplication table</h3>

        <nav class="navbar navbar-expand-md navbar-light bg-light rounded mb-3">

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav text-md-center nav-justified w-100">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">The Matrix<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#section_rules">Rules</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="https://github.com/Cervantico/multiplication-table" target="_blank">Get code from Github</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#section_contact">Contact</a>
                    </li>
                </ul>
            </div>
        </nav>

    </header>
    
    <div class="form-group row">
        <label for="matrix_size" class="col-sm-2 col-form-label">Matrix size</label>
        <div class="col-sm-2">
            <asp:DropDownList runat="server" ID="form_matrix_size" CssClass="form-control">
                <asp:ListItem Text="3" Value="3" />
                <asp:ListItem Text="4" Value="4" />
                <asp:ListItem Text="5" Value="5" />
                <asp:ListItem Text="6" Value="6" />
                <asp:ListItem Text="7" Value="7" />
                <asp:ListItem Text="8" Value="8" />
                <asp:ListItem Text="9" Value="9" />
                <asp:ListItem Text="10" Value="10" Selected="True" />
                <asp:ListItem Text="11" Value="11" />
                <asp:ListItem Text="12" Value="12" />
                <asp:ListItem Text="13" Value="13" />
                <asp:ListItem Text="14" Value="14" />
                <asp:ListItem Text="15" Value="15" />
            </asp:DropDownList>
        </div>
    </div>
    
    <div class="form-group row">
        <label for="matrix_base" class="col-sm-2 col-form-label">Matrix base</label>
        <div class="col-sm-2">
            <asp:DropDownList runat="server" ID="form_matrix_base" CssClass="form-control">
                <asp:ListItem Text="Decimal" Value="decimal" />
                <asp:ListItem Text="Binary" Value="binary" />
                <asp:ListItem Text="Hexadecimal" Value="hexadecimal" />
            </asp:DropDownList>
        </div>
    </div>

    <div class="form-group row">
        <div class="col-sm-10">
            <asp:Button runat="server" ID="generate" Text="Create Matrix" CssClass="btn btn-success" OnClick="generate_Click" />
        </div>
    </div>

    <!-- The matrix -->
    <section id="section_matrix">
        <div class="jumbotron">
            <asp:Table ID="the_matrix" runat="server"/>
        </div>
    </section>

    <!-- The rules -->
    <section id="section_rules">
        
        <div class="jumbotron bg-dark text-white">
            <div class="col-lg-8 mx-auto">
                <h2>The rules</h2>
                <ul class="text-left">
                    <li>Develop a web page that will plot to the screen the multiplication table up to 10X10</li>
                    <li>Add a tooltip to each cell, to show the exercise that it is the result of (i.e. 32 will show 8X4=32 in the tool tip)</li>
                    <li>Add a URL parameter matrix_size (or GUI control) that selects the value (default =10) between 3 to 15 and refresh the page to show the relevant table.</li>
                    <li>Add a URL parameter matrix_base (or GUI control) which has three options (decimal, binary, hex), so the user can decide in which format he will see the table. Once selected the table is refreshed with the relevant values</li>
                    <li>(Optional) – color the background of the Prime numbers</li>
                </ul>

            </div>
        </div>

    </section>

    <!-- Contact -->
    <section id="section_contact">
        <div class="jumbotron">

            <div class="col-lg-8 mx-auto">
                <h2>Néstor <span class="text-danger">Daza</span></h2>
                <p>
                    (514) 585-4452 · <a href="mailto:&#110;&#101;&#115;&#116;&#111;&#114;&#046;&#100;&#097;&#122;&#097;&#064;&#103;&#109;&#097;&#105;&#108;&#046;&#099;&#111;&#109;">&#110;&#101;&#115;&#116;&#111;&#114;&#046;&#100;&#097;&#122;&#097;&#064;&#103;&#109;&#097;&#105;&#108;&#046;&#099;&#111;&#109;</a>
                </p>
            
            </div>

        </div>
    </section>





</div>

</form>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

</body>
</html>
