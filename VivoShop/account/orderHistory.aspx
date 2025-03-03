<%@ Page Title="" Language="C#" MasterPageFile="~/VivoShop.Master" AutoEventWireup="true" CodeBehind="orderHistory.aspx.cs" Inherits="VivoShop.account.orderHistory" %>
<%@ Register Src="~/customControls/Header/Desktop/DesktopHeader.ascx" TagName="DesktopHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageHeaderControls/PageHeader.ascx" TagName="PageHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/account/accountNavigation.ascx" TagName="AccountNavigation" TagPrefix="Vivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Vivo:DesktopHeader runat="server" IsHomepage="false" />

    <div class="site__body">
        <Vivo:PageHeader ID="pageHeader" runat="server" Title="Istorija porudžbina" />

        <div class="block">
            <div class="container">
                <div class="row">
                    <Vivo:AccountNavigation runat="server" />
                    <div class="col-12 col-lg-9 mt-4 mt-lg-0">
                        <div class="card">
                            <div class="card-header">
                                <h5>Istorija porudžbina</h5>
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
                                                <th>Iznos</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="rptOrders" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><asp:HyperLink runat="server" NavigateUrl='<%#"/istorija-porudzbina/" + Eval("orderID") %>' Text='<%#"#" + Eval("code") %>'></asp:HyperLink></td>
                                                        <td><asp:Literal runat="server" Text='<%#Eval("date") %>'></asp:Literal></td>
                                                        <td><asp:Literal runat="server" Text='<%#Eval("status") %>'></asp:Literal></td>
                                                        <td><asp:Literal runat="server" Text='<%#string.Format("{0:N2}", Eval("total")) %>'></asp:Literal></td>
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContentPlaceholder" runat="server">
</asp:Content>
