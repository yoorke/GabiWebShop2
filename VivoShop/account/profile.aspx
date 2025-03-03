<%@ Page Title="" Language="C#" MasterPageFile="~/VivoShop.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="VivoShop.account.profile" %>
<%@ Register Src="~/customControls/Header/Desktop/DesktopHeader.ascx" TagName="DesktopHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageHeaderControls/PageHeader.ascx" TagName="PageHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/account/accountNavigation.ascx" TagName="AccountNavigation" TagPrefix="Vivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Vivo:DesktopHeader runat="server" IsHomepage="false" />

    <div class="site__body">
        <Vivo:PageHeader ID="pageHeader" runat="server" Title="Korisnički profil" />

        <div class="block">
            <div class="container">
                <div class="row">
                    <Vivo:AccountNavigation runat="server" />
                    <div class="col-12 col-lg-9 mt-4 mt-lg-0">
                        <div class="card">
                            <div class="card-header">
                                <h5>Izmena podataka</h5>
                            </div>
                            <div class="card-divider"></div>
                            <div class="card-body">
                                <div class="row no-gutters">
                                    <div class="col-12 col-lg-7 col-xl-6">
                                        <div class="form-group">
                                            <label for='<%=txtFirstName.ClientID %>'>Ime</label>
                                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="Ime"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for='<%=txtLastName.ClientID %>'>Prezime</label>
                                            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Prezime"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for='<%=txtEmail.ClientID %>'>Email</label>
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for='<%=txtAddress.ClientID %>'>Adresa</label>
                                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Adresa"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for='<%=txtZip.ClientID %>'>Ptt</label>
                                            <asp:TextBox ID="txtZip" runat="server" CssClass="form-control" placeholder="Ptt" TextMode="Number"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for='<%=txtCity.ClientID %>'>Mesto</label>
                                            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="Mesto"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for='<%=txtPhone.ClientID %>'>Telefon</label>
                                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Telefon"></asp:TextBox>
                                        </div>
                                        <div class="form-group mt-5 mb-0">
                                            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Sačuvaj" OnClick="btnSave_Click" />
                                        </div>
                                    </div>
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
