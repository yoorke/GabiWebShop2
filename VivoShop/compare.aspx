<%@ Page Title="" Language="C#" MasterPageFile="~/VivoShop.Master" AutoEventWireup="true" CodeBehind="compare.aspx.cs" Inherits="VivoShop.compare" %>

<%@ Register Src="~/customControls/Header/Desktop/DesktopHeader.ascx" TagName="DesktopHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageHeaderControls/PageHeader.ascx" TagName="PageHeader" TagPrefix="Vivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Vivo:DesktopHeader runat="server" IsHomepage="false" />

    <div class="site__body">
        <Vivo:PageHeader ID="pageHeader" runat="server" Title="Poređenje proizvoda" />
        <div class="block">
            <div class="container">
                <div id="divStatus" runat="server" class="row" visible="false">
                    <div class="col-12">
                        <div class="alert alert-warning">Nema proizvoda za poređenje</div>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="compare-table">
                        <tbody>
                            <tr>
                                <th>Proizvod</th>
                                <asp:Repeater ID="rptImages" runat="server" OnItemDataBound="rptImages_ItemDataBound">
                                    <ItemTemplate>
                                        <td>
                                            <asp:HyperLink runat="server" CssClass="compare-table__product-link" NavigateUrl='<%#Eval("url") %>'>
                                                <div class="compare-table__product-image">
                                                    <asp:Image ID="imgProduct" runat="server" ImageUrl='<%#Eval("images[0].imageUrl") %>' />
                                                    <div class="compare-table__product-name">
                                                        <asp:Literal ID="lblProductName" runat="server" Text='<%#Eval("name") %>'></asp:Literal>
                                                    </div>
                                                </div>
                                            </asp:HyperLink>
                                        </td>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tr>
                            <tr>
                                <th>Šifra</th>
                                <asp:Repeater ID="rptCode" runat="server">
                                    <ItemTemplate>
                                        <td>
                                            <asp:Literal ID="lblCode" runat="server" Text='<%#Eval("code") %>'></asp:Literal>
                                        </td>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tr>
                            <tr>
                                <th>Ocena</th>
                                <asp:Repeater ID="rptRating" runat="server">
                                    <ItemTemplate>
                                        <td></td>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tr>
                            <tr>
                                <th>Dostupnost</th>
                                <asp:Repeater ID="rptAvailability" runat="server">
                                    <ItemTemplate>
                                        <td>
                                            <asp:Label runat="server" CssClass="compare-table__product-badge badge badge-success" Visible='<%#bool.Parse(Eval("IsInStock").ToString()) %>' Text="Na stanju"></asp:Label>
                                            <asp:Label runat="server" CssClass="compare-table__product-badge badge badge-warning" Visible='<%#!bool.Parse(Eval("IsInStock").ToString()) %>' Text="Nema na stanju"></asp:Label>
                                        </td>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tr>
                            <tr>
                                <th>Cena</th>
                                <asp:Repeater ID="rptPrice" runat="server">
                                    <ItemTemplate>
                                        <td>
                                            <asp:Literal runat="server" Text='<%#string.Format("{0:N2}", Eval("WebPrice")) %>'></asp:Literal><small> RSD</small>
                                        </td>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tr>
                            <tr>
                                <th>U korpu</th>
                                <asp:Repeater ID="rptAddToCard" runat="server" OnItemDataBound="rptAddToCard_ItemDataBound">
                                    <ItemTemplate>
                                        <td>
                                            <asp:HiddenField ID="lblProductID" runat="server" Value='<%#Eval("productID") %>' />
                                            <asp:LinkButton ID="btnAddToCard" runat="server" CssClass="btn btn-primary">Dodaj u korpu</asp:LinkButton>
                                        </td>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tr>
                            <tr>
                                <th></th>
                                <asp:Repeater ID="rptRemove" runat="server" OnItemDataBound="rptRemove_ItemDataBound">
                                    <ItemTemplate>
                                        <td>
                                            <asp:HiddenField ID="lblProductID" runat="server" Value='<%#Eval("productID") %>' />
                                            <asp:LinkButton ID="btnRemove" runat="server" CssClass="btn btn-secondary btn-sm">Obriši</asp:LinkButton>
                                        </td>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContentPlaceholder" runat="server">
</asp:Content>
