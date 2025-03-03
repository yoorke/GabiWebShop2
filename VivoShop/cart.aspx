<%@ Page Title="" Language="C#" MasterPageFile="~/VivoShop.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="VivoShop.cart" %>
<%@ Register Src="~/customControls/Header/Desktop/DesktopHeader.ascx" TagName="DesktopHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageHeaderControls/PageHeader.ascx" TagName="PageHeader" TagPrefix="Vivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Vivo:DesktopHeader runat="server" IsHomepage="false" />

    <div class="site__body">
        <Vivo:PageHeader ID="pageHeader" runat="server" Title="Korpa" />

        <div class="cart block">
            <div class="container">
                <asp:Repeater ID="rptCart" runat="server" OnItemDataBound="rptCart_ItemDataBound">
                    <HeaderTemplate>
                        <table class="cart__table cart-table">
                            <thead class="cart-table__head">
                                <tr class="cart-table__row">
                                    <th class="cart-table__column cart-table__column--image">Slika</th>
                                    <th class="cart-table__column cart-table__column--product">Proizvod</th>
                                    <th class="cart-table__column cart-table__column--price">Cena</th>
                                    <th class="cart-table__column cart-table__column--quantity">Količina</th>
                                    <th class="cart-table__column cart-table__column--total">Ukupno</th>
                                    <th class="cart-table__column cart-table__column--remove"></th>
                                
                            </thead>
                            <tbody class="cart-table__body">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="cart-table__row">
                            <td class="cart-table__column cart-table__column--image">
                                <asp:Label ID="lblProductID" runat="server" Text='<%#Eval("productID") %>' Visible="false"></asp:Label>
                                <asp:Hyperlink ID="lnkProductImage" runat="server" NavigateUrl='<%# "/proizvodi/" + eshopBE.Product.CreateFriendlyUrl(Eval("categoryName") + "/" + Eval("brandName") + " " + Eval("name") + "-" + Eval("productID")) %>'>
                                    <asp:Image ID="imgProductImage" runat="server" ImageUrl='<%#Eval("imageUrl") %>' />
                                </asp:Hyperlink>
                            </td>
                            <td class="cart-table__column cart-table__column--product">
                                <a href="" class="cart-table__product-name"><asp:Literal ID="lblProductName" runat="server" Text='<%#Eval("Brand") + " " + Eval("name") %>'></asp:Literal></a>
                            </td>
                            <td class="cart-table__column cart-table__column--price" data-title="Cena">
                                <asp:Literal ID="lblProductPrice" runat="server" Text='<%#string.Format("{0:N2}", Eval("userPrice")) %>'></asp:Literal>
                            </td>
                            <td class="cart-table__column cart-table__column--quantity" data-title="Količina">
                                <div class="input-number">
                                    <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control input-number__input" Text='<%#Eval("quantity") %>' TextMode="Number"></asp:TextBox>
                                    <div class="input-number__add" onclick="CartFpUpdateQuantity('<%#Eval("productID") %>', 1)"></div>
                                    <div class="input-number__sub" onclick="CartFpUpdateQuantity('<%#Eval("productID") %>', -1)"></div>
                                </div>
                            </td>
                            <td class="cart-table__column cart-table__column--total" data-title="Ukupno">
                                <asp:Literal ID="lblTotal" runat="server" Text='<%#string.Format("{0:N2}", Eval("total")) %>'></asp:Literal>
                            </td>
                            <td class="cart-table__column cart-table__column--remove">
                                <button type="button" class="btn btn-light btn-sm btn-svg-icon" onclick="CartFpDeleteProduct('<%#Eval("productID") %>', true, event)">
                                    <svg width="12px" height="12px">
                                        <use xlink:href="/images/sprite.svg#cross-12"></use>
                                    </svg>
                                </button>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                            </tbody>
                            </tr>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <div class="cart__actions">
                    <div class="cart__coupon-form" role="form">
                        <label for="input-coupon-code" class="sr-only">Password</label>
                        <asp:TextBox ID="txtCoupon" runat="server" CssClass="form-control" placeholder="Kupon"></asp:TextBox>
                        <asp:Button ID="btnApplyCoupon" runat="server" CssClass="btn btn-primary" Text="Primeni kupon" />
                    </div>
                    <div class="cart__buttons">
                        <a href="/" class="btn btn-light">Nastavi kupovinu</a>
                        <asp:Button ID="btnUpdateCart" runat="server" CssClass="btn btn-primary cart__update-button" Text="Osveži korpu" OnClick="btnUpdateCart_Click" />
                        <a class="btn btn-primary btn-xl btn-block cart__checkout-button mt-2 d-block d-md-none" href="/porucivanje">Naruči</a>
                    </div>
                </div>
                <div class="row justify-content-end pt-5">
                    <div class="col-12 col-md-7 col-lg-6 col-xl-5">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title">Ukupno</h3>
                                <table class="cart__totals">
                                    <thead class="cart__totals-header">
                                        <tr>
                                            <th>Osnovica</th>
                                            <td><asp:Literal ID="lblSubTotal" runat="server" Text="0,00"></asp:Literal><small> RSD</small></td>
                                        </tr>
                                    </thead>
                                    <tbody class="cart__totals-body">
                                        <tr>
                                            <th>Porez</th>
                                            <td><asp:Literal ID="lblTax" runat="server" Text="0,00"></asp:Literal><small> RSD</small></td>
                                        </tr>
                                    </tbody>
                                    <tfoot class="cart__totals-footer">
                                        <tr>
                                            <th>Ukupno za plaćanje</th>
                                            <td><asp:Literal ID="lblTotal" runat="server" Text="0,00"></asp:Literal><small> RSD</small></td>
                                        </tr>
                                    </tfoot>
                                </table>
                                <a class="btn btn-primary btn-xl btn-block cart__checkout-button" href="/porucivanje">Naruči</a>
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
