<%@ Page Title="" Language="C#" MasterPageFile="~/VivoShop.Master" AutoEventWireup="true" CodeBehind="orderItems.aspx.cs" Inherits="VivoShop.account.orderItems" %>
<%@ Register Src="~/customControls/Header/Desktop/DesktopHeader.ascx" TagName="DesktopHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageHeaderControls/PageHeader.ascx" TagName="PageHeader" TagPrefix="Vivo"  %>
<%@ Register Src="~/customControls/account/accountNavigation.ascx" TagName="AccountNavigation" TagPrefix="Vivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Vivo:DesktopHeader runat="server" IsHomepage="false" />
    
    <div class="site__body">
        <Vivo:PageHeader ID="pageHeader" runat="server" />

        <div class="block">
            <div class="container">
                <div class="row">
                    <Vivo:AccountNavigation runat="server" />
                    <div class="col-12 col-lg-9 mt-4 mt-lg-0">
                        <div class="card">
                            <div class="card-header">
                                <h5>Porudžbina broj: <asp:Literal ID="lblOrderNumber" runat="server"></asp:Literal></h5>
                            </div>
                            <div class="card-divider"></div>
                            <div class="card-body">
                                <div class="row no-gutters">
                                    <div class="col-12 col-lg-7 col-xl-6">
                                        <div class="form-group row">
                                            <label for='<%=lblDate.ClientID %>' class="col-sm-4 col-form-label">Datum</label>
                                            <div class="col-sm-8">
                                                <asp:Label ID="lblDate" runat="server" class="form-control"></asp:Label> 
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for='<%=lblStatus.ClientID %>' class="col-sm-4 col-form-label">Status</label>
                                            <div class="col-sm-8">
                                                <asp:Label ID="lblStatus" runat="server" class="form-control"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for='<%=lblStatusDate.ClientID %>' class="col-sm-4 col-form-label">Datum statusa</label>
                                            <div class="col-sm-8">
                                                <asp:Label ID="lblStatusDate" runat="server" class="form-control"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-table">
                                <div class="table-responsive-sm">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Proizvod</th>
                                                <th>Naziv</th>
                                                <th>Cena</th>
                                                <th>Količina</th>
                                                <th>Ukupno</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="rptOrderItems" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><asp:HyperLink runat="server" NavigateUrl='<%#Eval("Product.url") %>' Text='<%#Eval("Product.name") %>'></asp:HyperLink></td>
                                                        <td><asp:Literal ID="lblProductName" runat="server" Text='<%#Eval("product.Name") %>'></asp:Literal></td>
                                                        <td><asp:Literal ID="lblProductPrice" runat="server" Text='<%#Eval("userprice") %>'></asp:Literal></td>
                                                        <td><asp:Literal ID="lblProductCount" runat="server" Text='<%#Eval("quantity") %>'></asp:Literal></td>
                                                        <td><asp:Literal ID="lblProductTotal" runat="server" Text='<%#string.Format("{0:N2}", double.Parse(Eval("quantity").ToString()) * double.Parse(Eval("userPrice").ToString())) %>'></asp:Literal></td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="row no-gutters">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for='<%=lblTotal.ClientID %>'>Ukupno</label>
                                            <asp:Label ID="lblTotal" runat="server" class="form-control"></asp:Label>
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
