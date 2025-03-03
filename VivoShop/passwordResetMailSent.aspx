<%@ Page Title="" Language="C#" MasterPageFile="~/VivoShop.Master" AutoEventWireup="true" CodeBehind="passwordResetMailSent.aspx.cs" Inherits="VivoShop.passwordResetMailSent" %>
<%@ Register Src="~/customControls/Header/Desktop/DesktopHeader.ascx" TagName="DesktopHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageHeaderControls/PageHeader.ascx" TagName="PageHeader" TagPrefix="Vivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Vivo:DesktopHeader runat="server" IsHomepage="false"></Vivo:DesktopHeader>

    <div class="site__body">
        <Vivo:PageHeader runat="server" Title=""></Vivo:PageHeader>
        <div class="block">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-8 col-lg-6 offset-lg-3">
                        <div class="alert alert-success text-center">
                            <h5><strong>Email poruka sa linkom za kreiranje nove korisničke šifre je poslata na email adresu koju ste naveli.</strong></h5>
                            <p>Nakon što Vam stigne email poruka potrebno je da kliknete na link u samoj email poruci koji će Vas odvesti na
                                stranicu za kreiranje nove korisničke šifre. Pratite uputstva na stranici kako biste kreirali novu korisničku šifru.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContentPlaceholder" runat="server">
</asp:Content>
