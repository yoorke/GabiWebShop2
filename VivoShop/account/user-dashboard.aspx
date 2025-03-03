<%@ Page Title="" Language="C#" MasterPageFile="~/VivoShop.Master" AutoEventWireup="true" CodeBehind="user-dashboard.aspx.cs" Inherits="VivoShop.account.user_dashboard" %>
<%@ Register Src="~/customControls/Header/Desktop/DesktopHeader.ascx" TagName="DesktopHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageHeaderControls/PageHeader.ascx" TagName="PageHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/account/accountNavigation.ascx" TagName="AccountNavigation" TagPrefix="Vivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Vivo:DesktopHeader runat="server" IsHomepage="false" />

    <div class="site__body">
        <Vivo:PageHeader ID="pageHeader" runat="server" Title="Moj nalog" />
        <div class="block">
            <div class="container">
                <div class="row">
                    <Vivo:AccountNavigation runat="server"></Vivo:AccountNavigation>
                    <div class="col-12 col-lg-9 mt-4 mt-lg-0">
                        <div class="dashboard">
                            <div class="dashboard__profile card profile-card">
                                <div class="card-body profile-card__body">
                                    <div class="profile-card__avatar">
                                        <img src="/images/avatars/avatar.gif" alt="User image" />
                                    </div>
                                    <div class="profile-card__name"><asp:Literal ID="lblName" runat="server"></asp:Literal></div>
                                    <div class="profile-card__email"><asp:Literal ID="lblEmail" runat="server"></asp:Literal></div>
                                    <div class="profile-card__edit">
                                        <a href="/moj-profil" class="btn btn-secondary btn-sm">Izmeni podatke</a>
                                    </div>
                                </div>
                            </div>
                            <div class="dashboard__address card address-card address-card--featured">
                                <div class="address-card__badge">Podrazumevana adresa</div>
                                <div class="address-card__body">
                                    <div class="address-card__name"><asp:Literal ID="lblAddressName" runat="server"></asp:Literal></div>
                                    <div class="address-card__row">
                                        <asp:Literal ID="lblAddress" runat="server"></asp:Literal>
                                    </div>
                                    <div class="address-card__row">
                                        <div class="address-card__row-title">Telefon</div>
                                        <div class="address-card__row-content"><asp:Literal ID="lblPhone" runat="server"></asp:Literal></div>
                                    </div>
                                    <div class="address-card__row">
                                        <div class="address-card__row-title">Email adresa</div>
                                        <div class="address-card__row-title-content"><asp:Literal ID="lblAddressEmail" runat="server"></asp:Literal></div>
                                    </div>
                                    <div class="address-card__footer">
                                        <a href="">Izmena adrese</a>
                                    </div>
                                </div>
                            </div>
                            <div class="dashboard__orders card">
                                <div class="card-header">
                                    <h5>Nedavne porudžbine</h5>
                                </div>
                                <div class="card-divider"></div>
                                <div class="card-table">
                                    <div class="table-responsive-sm">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>Porudžbina</th>
                                                    <th>Datum</th>
                                                    <th>Status</th>
                                                    <th>Ukupno</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="rptOrders" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td><asp:HyperLink runat="server" NavigateUrl='<%#"/" + Eval("orderID") %>' Text='<%#Eval("orderID") %>'></asp:HyperLink></td>
                                                            <td><asp:Literal runat="server" Text='<%#Eval("date") %>'></asp:Literal></td>
                                                            <td><asp:Literal runat="server" Text='<%#Eval("status") %>'></asp:Literal></td>
                                                            <td><asp:Literal runat="server" Text='<%#Eval("total") %>'></asp:Literal></td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </tbody>
                                        </table>
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
