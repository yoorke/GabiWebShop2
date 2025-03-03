<%@ Page Title="" Language="C#" MasterPageFile="~/VivoShop.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="VivoShop.checkout" %>
<%@ Register Src="~/customControls/Header/Desktop/Desktopheader.ascx" TagName="DesktopHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageHeaderControls/PageHeader.ascx" TagName="PageHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageNotification/PageNotification.ascx" TagName="PageNotification" TagPrefix="Vivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Vivo:DesktopHeader runat="server" IsHomepage="false" />

    <div class="site__body">
        <Vivo:PageHeader ID="pageHeader" runat="server" Title="Naručivanje" />

        <div class="checkout block">
            <div class="container">
                <div class="row">
                    <div class="col-12 mb-3">
                        <div class="alert alert-lg alert-primary">Već imate nalog? <a href="/prijava">Kliknite za prijavu</a></div>
                    </div>
                    <Vivo:PageNotification ID="PageNotification" runat="server" Visible="false" />
                    <div class="col-12 col-lg-6 col-xl-7">
                        <div class="card mb-lg-0">
                            <div class="card-body">
                                <h3 class="card-title">Podaci za dostavu</h3>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for='<%=rdbUserType.ClientID %>'>Tip kupca:</label>
                                        <asp:RadioButtonList ID="rdbUserType" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="radio" OnSelectedIndexChanged="rdbUserType_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem Text="Fizičko lice" Value="1" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Pravno lice" Value="2"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="<%#txtFirstName.ClientID %>">Ime <small class="text-danger">*</small></label>
                                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="Ime"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="requiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Ime je obavezan podatak" Display="Dynamic" CssClass="form-error-control"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="<%#txtLastName.ClientID %>">Prezime <small class="text-danger">*</small></label>
                                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Prezime"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="requiredFieldValidator2" runat="server" ControlToValidate="txtLastName" ErrorMessage="Prezime je obavezan podatak" Display="Dynamic" CssClass="form-error-control"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-row" id="divCompany" runat="server" style="display: none">
                                    <div class="form-group col-md-8">
                                        <label for="<%#txtCompanyName.ClientID %>">Naziv <small class="text-danger">*</small></label>
                                        <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control" placeholder="Naziv"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="requiredFieldValidatorCompanyName" runat="server" ControlToValidate="txtCompanyName" ErrorMessage="Naziv" Display="Dynamic" CssClass="form-error-control"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="<%=txtTaxID.ClientID %>">Pib <small class="text-danger">*</small></label>
                                        <asp:TextBox ID="txtTaxID" runat="server" CssClass="form-control" placeholder="Pib" TextMode="Number"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="requiredFieldValidatorTaxID" runat="server" ControlToValidate="txtTaxID" ErrorMessage="PIB je obavezn podatak" Display="Dynamic" CssClass="form-error-control"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="<%#txtAddress.ClientID %>">Adresa <small class="text-danger">*</small></label>
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Adresa"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="requiredFieldValidator3" runat="server" ControlToValidate="txtAddress" ErrorMessage="Adresa je obavezan podatak" Display="Dynamic" CssClass="form-error-control"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="<%#txtCity.ClientID %>">Mesto <small class="text-danger">*</small></label>
                                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="Mesto"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="requiredFieldValidator4" runat="server" ControlToValidate="txtCity" ErrorMessage="Mesto je obavezn podatak" Display="Dynamic" CssClass="form-error-control"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="<%#txtZip.ClientID %>">Ptt <small class="text-danger">*</small></label>
                                        <asp:TextBox ID="txtZip" runat="server" CssClass="form-control" placeholder="Ptt"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="requiredFieldValidator5" runat="server" ControlToValidate="txtZip" ErrorMessage="Ptt je obavezn podatak" Display="Dynamic" CssClass="form-error-control"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="<%#txtEmail.ClientID %>">Email <small class="text-danger">*</small></label>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="requiredFieldValidator6" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email je obavezn podatak" Display="Dynamic" CssClass="form-error-control"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="<%#txtPhone.ClientID %>">Telefon <small class="text-danger">*</small></label>
                                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Telefon"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="requiredFieldValidator7" runat="server" ControlToValidate="txtPhone" ErrorMessage="Telefon je obavezan podatak" Display="Dynamic" CssClass="form-error-control"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="<%#txtComment.ClientID %>"">Napomena</label>
                                    <asp:TextBox ID="txtComment" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Napomena" Height="120px"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <div class="form-check">
                                        <span class="form-check-input input-check">
                                            <span class="input-check__body">
                                                <%--<asp:CheckBox ID="chkCreateAccount" runat="server" CssClass="input-check__input" />--%>
                                                <input type="checkbox" class="input-check__input" id="checkoutcreateaccount" runat="server" />
                                                <span class="input-check__box"></span>
                                                <svg class="input-check__icon" width="9px" height="7px">
                                                    <use xlink:href="/images/sprite.svg#check-9x7"></use>
                                                </svg>
                                            </span>
                                        </span>
                                        <label class="form-check-label" for="<%=checkoutcreateaccount.ClientID%>">Kreiraj nalog</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <small>
                                        <span class="fa fa-info-circle text-info"></span>
                                        <span>
                                            Kreiranjem korisničkog naloga bićete u mogućnosti da lakše i brže završite proces kupovine, pratite
                                            porudžbine, vidite istoriju porudžbina i dr.
                                        </span>
                                    </small>
                                </div>
                                <div class="form-group">
                                    <small>
                                        <span class="fa fa-exclamation-circle text-info"></span>
                                        <span>
                                            Polja obeležena zvezdicom * su obavezna za unos.
                                        </span>
                                    </small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-6 col-xl-5 mt-4 mt-lg-0">
                        <div class="card mb-0">
                            <div class="card-body">
                                <h3 class="card-title">Vaša korpa</h3>
                                <asp:Repeater ID="rptCart" runat="server" OnItemDataBound="rptCart_ItemDataBound">
                                    <HeaderTemplate>
                                        <table class="checkout__totals">
                                            <thead class="checkout__totals-header">
                                                <tr>
                                                    <th>Artikal</th>
                                                    <th>Ukupno [RSD]</th>
                                                </tr>
                                            </thead>
                                            <tbody class="checkout__totals-product">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><asp:Literal ID="lblProductName" runat="server" Text='<%#Eval("name") + " x " + Eval("quantity") %>'></asp:Literal></td>
                                            <td><asp:Literal ID="lblProductPrice" runat="server" Text='<%#string.Format("{0:N2}", double.Parse(Eval("userPrice").ToString()) * double.Parse(Eval("quantity").ToString())) %>'></asp:Literal></td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                            </tbody>
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                                <h5 class="card-title">Način dostave</h5>
                                <div class="payment-methods">
                                    <ul class="payment-methods__list">
                                        <li class="payment-methods__item payment-methods__item--active">
                                            <label class="payment-methods__item-header">
                                                <span class="payment-methods__item-radio input-radio">
                                                    <span class="input-radio__body">
                                                        <input ID="rdbDeliveryService" runat="server" class="input-radio__input" name="checkout_payment_method" type="radio" checked />
                                                        <span class="input-radio__circle"></span>
                                                    </span>
                                                </span>
                                                <span class="payment-methods__item-title">Dostava kurirskom službom</span>
                                            </label>
                                            <div class="payment-methods__item-container">
                                                <div class="payment-methods__item-description text-muted">
                                                    Za porudžbine vrednosti preko <strong><%=string.Format("{0:N2}", Settings.FreeDeliveryTotalValue) %> dinara</strong> dostava je <strong>BESPLATNA</strong>.
                                                    Za porudžbine čija vrednost ne prelazi navedeni iznos naplaćuje se dostava po cenovniku kurirske službe.
                                                </div>
                                            </div>
                                        </li>
                                        <li class="payment-methods__item">
                                            <label class="payment-methods__item-header">
                                                <span class="payment-methods__item-radio input-radio">
                                                    <span class="input-radio__body">
                                                        <input ID="rdbPickInStore" runat="server" class="input-radio__input" name="checkout_payment_method" type="radio" />
                                                        <span class="input-radio__circle"></span>
                                                    </span>
                                                </span>
                                                <span class="payment-methods__item-title">Preuzimanje u radnji</span>
                                            </label>
                                            <div class="payment-methods__item-container">
                                                <div class="payment-methods__item-description text-muted">
                                                    <div class="form-group">
                                                        <label for="<%=cmbShop.ClientID %>">Odaberite prodavnicu za preuzimanje</label>
                                                        <asp:DropDownList ID="cmbShop" runat="server" CssClass="form-control form-control-select2"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <h5 class="card-title">Način plaćanja</h5>
                                <div class="payment-methods">
                                    <asp:Repeater ID="rptPaymentMethods" runat="server" OnItemDataBound="rptPaymentMethods_ItemDataBound">
                                        <HeaderTemplate>
                                            <ul class="payment-methods__list">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:HiddenField ID="lblPaymentID" runat="server" Value='<%#Eval("PaymentID") %>' />
                                            <li ID="paymentItem" runat="server" class="payment-methods__item">
                                                <label class="payment-methods__item-header">
                                                    <span class="payment-methods__item-radio input-radio">
                                                        <span class="input-radio__body">
                                                            <input ID="rdbPaymentMethod" runat="server" class="input-radio__input" name="checkout_payment_method" type="radio" />
                                                            <span class="input-radio__circle"></span>
                                                        </span>
                                                    </span>
                                                    <span class="payment-methods__item-title"><asp:Literal ID="lblPaymentMethodName" runat="server" Text='<%#Eval("Name") %>'></asp:Literal></span>
                                                </label>
                                                <div class="payment-methods__item-container">
                                                    <div class="payment-methods__item-description text-muted">
                                                        <asp:Literal ID="lblPaymentMethodDescription" runat="server" Text='<%#Eval("Description") %>'></asp:Literal>
                                                    </div>
                                                </div>
                                            </li>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </ul>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </div>
                                <hr />
                                <h5 class="card-title mb-0">Vrednost porudžbine</h5>
                                <table class="checkout__totals">
                                    <tbody class="checkout__totals-subtotals">
                                        <tr>
                                            <th>Broj proizvoda <small>[kom]</small></th>
                                            <td><asp:Literal ID="lblProductsCount" runat="server" Text="0,00"></asp:Literal></td>
                                        </tr>
                                        <tr>
                                            <th>Vrednost korpe <small>[RSD]</small></th>
                                            <td><asp:Literal ID="lblCartTotal" runat="server" Text="0,00"></asp:Literal></td>
                                        </tr>
                                        <tr>
                                            <th>Popust <small>[RSD]</small></th>
                                            <td><asp:Literal ID="lblDiscount" runat="server" Text="0,00"></asp:Literal></td>
                                        </tr>
                                        <tr>
                                            <th><small>Osnovica <small>[RSD]</small></small></th>
                                            <td><small><asp:Literal ID="lblSubtotal" runat="server" Text="0,00"></asp:Literal></small></td>
                                        </tr>
                                        <tr>
                                            <th><small>Pdv <small>[RSD]</small></small></th>
                                            <td><small><asp:Literal ID="lblTax" runat="server" Text="0,00"></asp:Literal></small></td>
                                        </tr>
                                        <tr>
                                            <th class="pb-2">Ukupna vrednost <small>[RSD]</small></th>
                                            <td class="pb-2"><asp:Literal ID="lblShopTotal" runat="server" Text="0,00"></asp:Literal></td>
                                        </tr>
                                        <tr id="totalWeightRow" runat="server" visible="false">
                                            <th>Ukupna težina <small>[kg]</small></th>
                                            <td><asp:Literal ID="lblTotalWeight" runat="server" Text="0,00"></asp:Literal></td>
                                        </tr>
                                        <tr>
                                            <th>Iznos dostave <small>[RSD]</small></th>
                                            <td><asp:Literal ID="lblDeliveryCost" runat="server" Text="0,00"></asp:Literal></td>
                                        </tr>
                                    </tbody>
                                    <tfoot class="checkout__totals-footer">
                                        <tr>
                                            <th>Ukupno</th>
                                            <td><asp:Literal ID="lblTotal" runat="server" Text="0,00"></asp:Literal><small> RSD</small></td>
                                        </tr>
                                        <tr>
                                            <th></th>
                                            <td><small><asp:Literal ID="lblTotalComment" runat="server" Text=""></asp:Literal></small></td>
                                        </tr>
                                        <tr>
                                            <th></th>
                                            <td>
                                                <hr />
                                                <small><asp:HyperLink runat="server" NavigateUrl="/cenovnik-dostave" Target="_blank">Cenovnik dostave</asp:HyperLink></small>
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                                <div style="position: relative">
                                    <%--<asp:CheckBox ID="chkTermsAndConditions" runat="server" AutoPostBack="true" />--%>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="chkTermsAndConditions" />
                                        <label class="form-check-label" for="chkTermsAndConditions">Prihvatam <a href="/uslovi-koriscenja" target="_blank">uslove korišćenja</a></label>
                                    </div>
                                    <span id="lblTaCErrorMessage" class="form-error-control" style="display:none;">Prihvatite uslove korišćenja.</span>
                                    <%--<asp:HyperLink runat="server" NavigateUrl="~/uslovi-koriscenja" Text="Prihvatam uslove korišćenja" Target="_blank"></asp:HyperLink>--%>
                                    <%--<asp:Button ID="btnOrder" runat="server" CssClass="btn btn-primary btn-xl btn-block" OnClick="btnOrder_Click" Text="Poruči" OnClientClick="return validateForm()" />--%>
                                    <asp:LinkButton ID="btnOrder" runat="server" CssClass="btn btn-primary btn-xl btn-clock" OnClick="btnOrder_Click" Text="Poruči" OnClientClick="return validateForm()"></asp:LinkButton>
                                    <span id="workerBox" class="worker-box" style="display: none"><span class="fa fa-spinner fa-spin"></span></span>
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
    <script>
        function validateForm() {
            $('[id*=requiredFieldValidator]').removeAttr('style');
            $('[id*=regularExpressionValidator]').removeAttr('style');

            if (Page_ClientValidate('')) {
                if ($('#chkTermsAndConditions')[0].checked == false) {
                    alert('Morate prihvatiti uslove korišćenja.');
                    $('#lblTaCErrorMessage').css('display', 'block');
                    return false;
                }
                else {
                    $('.worker-box').show();
                    $('[id*=btnOrder]').attr('disabled', true);
                    return true;
                }
            }
            else {
                $('body,html').animate({
                    scrollTop: $('[id*=txtFirstName]').offset().top - 90
                }, 700);
                return false;
            }
        }

        function scrollToNotification() {
            let offset = $('#pn').offset();
            $('body,html').animate({
                scrollTop: offset.top - 50,
                scrollLeft: offset.left
            }, 500);
        }
    </script>
</asp:Content>
