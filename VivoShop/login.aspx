<%@ Page Title="" Language="C#" MasterPageFile="~/VivoShop.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="VivoShop.login" %>
<%@ Register Src="~/customControls/Header/Desktop/DesktopHeader.ascx" TagName="DesktopHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageHeaderControls/PageHeader.ascx" TagName="PageHeader" TagPrefix="Vivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Vivo:DesktopHeader runat="server" IsHomepage="false"></Vivo:DesktopHeader>

    <div class="site__body">
        <Vivo:PageHeader ID="pageHeader" runat="server"></Vivo:PageHeader>
        <div class="block">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-sm-8 offset-sm-4 col-md-6 offset-md-3 col-lg-4 offset-lg-4">
                        <asp:Login ID="login1" runat="server" Width="100%" DestinationPageUrl="/" FailureText="Prijava nije uspešna" LoginButtonText="Prijavi se" OnLoginError="login1_LoginError">
                            <LayoutTemplate>
                                <table border="0" cellpadding="1" cellspacing="0" style="border-collapse:collapse" width="100%">
                                    <tr>
                                        <td>
                                            <table border="0" cellpadding="0" width="100%">
                                                <tr style="margin-bottom:20px">
                                                    <td style="text-align:center" colspan="2">

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:TextBox ID="Username" runat="server" placeholder="Email" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="usernameRequiredValidator" runat="server"
                                                            ControlToValidate="Username" ErrorMessage="Unesite email" ToolTip="Unesite email" ValidationGroup="login"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:TextBox ID="Password" runat="server" placeholder="Šifra" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="passwordRequiredValidator" runat="server"
                                                            ControlToValidate="Password" ErrorMessage="Unesite šifru" ToolTip="Unesite šifru" ValidationGroup="login"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="1">
                                                        <asp:CheckBox ID="chkRememberMe" runat="server" CssClass="" />
                                                        <asp:Label runat="server" CssClass="form-check-label">Zapamti me</asp:Label>
                                                    </td>
                                                    <td class="text-right">
                                                        <asp:HyperLink ID="lnkResetPassword" runat="server" NavigateUrl="/resetovanje-sifre">Zaboravili ste šifru</asp:HyperLink>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center; color: red" colspan="2">
                                                        <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right" colspan="2">
                                                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Prijavi se" ValidationGroup="login" CssClass="btn btn-primary w-100" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                        </asp:Login>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContentPlaceholder" runat="server">
</asp:Content>
