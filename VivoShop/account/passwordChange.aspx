<%@ Page Title="" Language="C#" MasterPageFile="~/VivoShop.Master" AutoEventWireup="true" CodeBehind="passwordChange.aspx.cs" Inherits="VivoShop.account.passwordChange" %>

<%@ Register Src="~/customControls/Header/Desktop/DesktopHeader.ascx" TagName="DesktopHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageHeaderControls/PageHeader.ascx" TagName="PageHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/account/accountNavigation.ascx" TagName="AccountNavigation" TagPrefix="Vivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Vivo:DesktopHeader runat="server" IsHomepage="false" />

    <div class="site__body">
        <Vivo:PageHeader ID="pageHeader" runat="server" Title="Izmena šifre" />

        <div class="block">
            <div class="container">
                <div class="row">
                    <Vivo:AccountNavigation runat="server" />
                    <div class="col-12 col-lg-9 mt-4 mt-lg-0">
                        <div class="card">
                            <div class="card-header">
                                <h5>Izmena šifre</h5>
                            </div>
                            <div class="card-divider"></div>
                            <div class="card-body">
                                <div class="row no-gutters">
                                    <div class="col-12 col-lg-7 col-xl-6">
                                        <div class="form-group">
                                            <label for='<%#txtPassword.ClientID %>'>Stara šifra</label>
                                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Stara šifra"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for='<%=txtNewPassword.ClientID %>'>Nova šifra</label>
                                            <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Nova šifra"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for='<%=txtNewPasswordConfirmed.ClientID %>'>Ponovite novu šifru</label>
                                            <asp:TextBox ID="txtNewPasswordConfirmed" runat="server" CssClass="form-control" TextMode="Password" placeholder="Ponovite novu šifru"></asp:TextBox>
                                        </div>
                                        <div class="form-group mt-5 mb-0">
                                            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Sačuvaj" OnClick="btnSave_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div id="statusBox" runat="server" visible="false" class="alert">
                                    <asp:Literal ID="lblStatus" runat="server"></asp:Literal>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContentPlaceholder" runat="server">
</asp:Content>
