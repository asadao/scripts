# Varnish 
# Date: 09-22-2017
# Autor: Helias Rodrigues
#
# Description:
# This file set all redirect responses
# 
# Help use:
# - Duplicate vcl_recv and vcl_error
# - apply your changes 
# - reload service
# 
# The End!
backend default {
  .host = "127.0.0.1";
  .port = "80";
}

# HEADERS MASQUERADE
sub vcl_deliver {
    remove resp.http.Via;
    remove resp.http.X-Whatever;
    remove resp.http.X-Powered-By;
    remove resp.http.X-Varnish;
    remove resp.http.Age;
    remove resp.http.Server;
    set resp.http.Server = "WMREDIR";
    set resp.http.X-Powered-By = "Webmotors";
}

# WEBMOTORS
sub vcl_recv {
    if (req.http.host == "webmotors.com.br" ) {
        set req.http.host = "www.webmotors.com.br";
        error 750 "https://" + req.http.host + req.url;
    }
}

sub vcl_error {
    if (obj.status == 750) {
        set obj.http.Location = obj.response;
        set obj.status = 301;
        return(deliver);
    }
}

# BLACKFEIRAO
sub vcl_recv {
    if (req.http.host == "blackfeirao.com.br" ) {
        set req.http.host = "www.blackfeirao.com.br";
        error 752 "https://" + req.http.host + req.url;
    }
}

sub vcl_error {
    if (obj.status == 752) {
        set obj.http.Location = obj.response;
        set obj.status = 301;
        return(deliver);
    }
}

sub vcl_recv {
    if (req.http.host == "blackfeirao.com" ) {
        set req.http.host = "www.blackfeirao.com.br";
        error 753 "https://" + req.http.host + req.url;
    }
}

sub vcl_error {
    if (obj.status == 753) {
        set obj.http.Location = obj.response;
        set obj.status = 301;
        return(deliver);
    }
}

sub vcl_recv {
    if (req.http.host == "www.blackfeirao.com" ) {
        set req.http.host = "www.blackfeirao.com.br";
        error 754 "https://" + req.http.host + req.url;
    }
}

sub vcl_error {
    if (obj.status == 754) {
        set obj.http.Location = obj.response;
        set obj.status = 301;
        return(deliver);
    }
}

sub vcl_recv {
    if (req.http.host == "blackfeirao.webmotors.com.br" ) {
        set req.http.host = "www.blackfeirao.com.br";
        error 755 "https://" + req.http.host;
    }
}

sub vcl_error {
    if (obj.status == 755) {
        set obj.http.Location = obj.response;
        set obj.status = 301;
        return(deliver);
    }
}

sub vcl_recv {
    if (req.http.host == "www.blackfeirao.webmotors.com.br" ) {
        set req.http.host = "www.blackfeirao.com.br";
        error 756 "https://" + req.http.host;
    }
}

sub vcl_error {
    if (obj.status == 756) {
        set obj.http.Location = obj.response;
        set obj.status = 301;
        return(deliver);
    }
}

# INFOMOTORS
sub vcl_recv {
    if (req.http.host == "www.infomotors.com.br" ) {
        set req.http.host = "www.infomotors-checkauto.com.br";
        error 757 "https://" + req.http.host + req.url;
    }
}

sub vcl_error {
    if (obj.status == 757) {
        set obj.http.Location = obj.response;
        set obj.status = 301;
        return(deliver);
    }
}

sub vcl_recv {
    if (req.http.host == "infomotors.com.br" ) {
        set req.http.host = "www.infomotors-checkauto.com.br";
        error 758 "https://" + req.http.host + req.url;
    }
}

sub vcl_error {
    if (obj.status == 758) {
        set obj.http.Location = obj.response;
        set obj.status = 301;
        return(deliver);
    }
}

# SE LIGA NA VIDA
sub vcl_recv {
    if (req.http.host == "seliganavida.com.br" ) {
        set req.http.host = "seliganavida.webmotors.com.br";
        error 759 "https://" + req.http.host + req.url;
    }
}

sub vcl_error {
    if (obj.status == 759) {
        set obj.http.Location = obj.response;
        set obj.status = 301;
        return(deliver);
    }
}

sub vcl_recv {
    if (req.http.host == "www.seliganavida.com.br" ) {
        set req.http.host = "seliganavida.webmotors.com.br";
        error 760 "https://" + req.http.host + req.url;
    }
}

sub vcl_error {
    if (obj.status == 760) {
        set obj.http.Location = obj.response;
        set obj.status = 301;
        return(deliver);
    }
}

# PLATAFORMA
sub vcl_recv {
    if (req.http.host == "plataforma.webmotors.com.br" || 
	req.http.host == "webmotors.vmotors.com.br"  || 
	req.http.host == "compreauto.vmotors.com.br"  || 
	req.http.host == "meucarango.vmotors.com.br" ) {
        set req.http.host = "cockpit.webmotors.com.br";
        error 761 "https://" + req.http.host + req.url;
    }
}

sub vcl_error {
    if (obj.status == 761) {
        set obj.http.Location = obj.response;
        set obj.status = 301;
        return(deliver);
    }
}

# WMTV e Jogo Aberto
sub vcl_recv {
    if (req.http.host == "jogoaberto.webmotors.com.br" || 
	req.http.host == "www.jogoaberto.webmotors.com.br") {
        set req.http.host = "vender.webmotors.com.br/parceiro/carro?idcmp=t2:c18:m07:JogoAberto:JogoAbertoXX::Banner_Parceiro&utm_medium=CRM-Parceria_20&utm_source=JogoAberto&utm_campaign=JogoAbertoXX&utm_content=Banner_Parceiro&utm_term=";
        error 762 "https://" + req.http.host;
    }
}

sub vcl_error {
    if (obj.status == 762) {
        set obj.http.Location = obj.response;
        set obj.status = 302;
        return(deliver);
    }
}

sub vcl_recv {
    if (req.http.host == "tv.webmotors.com.br" || 
	req.http.host == "www.tv.webmotors.com.br") {
        set req.http.host = "vender.webmotors.com.br/parceiro/carro?idcmp=t2:c18:m07:WebmotorsTV:WebmotorsTVXX::Banner_Parceiro&utm_medium=CRM-Parceria_20&utm_source=WebmotorsTV&utm_campaign=WebmotorsTVXX&utm_content=Banner_Parceiro&utm_term=";
        error 763 "https://" + req.http.host;
    }
}

sub vcl_error {
    if (obj.status == 763) {
        set obj.http.Location = obj.response;
        set obj.status = 302;
        return(deliver);
    }
}

# Revista
sub vcl_recv {
    if (req.http.host == "saloes.webmotors.com.br" || 
        req.http.host == "revista.webmotors.com.br" || 
        req.http.host == "revista.compreauto.com.br" || 
        req.http.host == "revista.meucarango.com.br") {
        set req.http.host = "www.wm1.com.br";
        error 764 "https://" + req.http.host + req.url;
    }
}

sub vcl_error {
    if (obj.status == 764) {
        set obj.http.Location = obj.response;
        set obj.status = 301;
        return(deliver);
    }
}

# BO
sub vcl_recv {
    if (req.http.host == "bo.webmotors.com.br" ) {
        set req.http.host = "www.webmotors.com.br";
        error 765 "https://" + req.http.host + req.url;
    }
}

sub vcl_error {
    if (obj.status == 765) {
        set obj.http.Location = obj.response;
        set obj.status = 301;
        return(deliver);
    }
}


# Redirects Feirão Alagoas e Sergipe
sub vcl_recv {
    if (req.http.host == "carnavaldeofertasalagoas.webmotors.com.br" || req.http.host == "carnavaldeofertassergipe.webmotors.com.br" ) {
        set req.http.host = "carnavaldeofertasalagoassergipe.webmotors.com.br";
        error 766 "https://" + req.http.host + req.url;
    }
}

sub vcl_error {
    if (obj.status == 766) {
        set obj.http.Location = obj.response;
        set obj.status = 301;
        return(deliver);
    }
}

# Redirects Pedagio(s)
sub vcl_recv {
    if (req.http.host == "pedagio.webmotors.com.br") {
        set req.http.host = "vender.webmotors.com.br/parceiro/carro?parceiro=wm&idcmp=t2:c18:m07:Ecopistas:Pedagio15OFF::Bobina&utm_medium=CRM-Parceria_15&utm_source=Ecopistas&utm_campaign=Pedagio15OFF&utm_content=Bobina&utm_term=";
        error 767 "https://" + req.http.host + req.url;
    }
}

sub vcl_error {
    if (obj.status == 767) {
        set obj.http.Location = obj.response;
        set obj.status = 301;
        return(deliver);
    }
}

sub vcl_recv {
    if (req.http.host == "pedagios.webmotors.com.br") {
        set req.http.host = "vender.webmotors.com.br/parceiro/carro?parceiro=wm&idcmp=t2:c18:m07:Ecovias:Pedagio15OFF::Bobina&utm_medium=CRM-Parceria_15&utm_source=Ecovias&utm_campaign=Pedagio15OFF&utm_content=Bobina&utm_term=";
        error 768 "https://" + req.http.host + req.url;
    }
}

sub vcl_error {
    if (obj.status == 768) {
        set obj.http.Location = obj.response;
        set obj.status = 301;
        return(deliver);
    }
}

# Redirects CRM Hyundai
sub vcl_recv {
    if (req.http.host == "gestordeleadshmb.com.br" || req.http.host == "www.gestordeleadshmb.com.br") {
        set req.http.host = "crm.webmotors.com.br/login?source=hyundai";
        error 769 "https://" + req.http.host + req.url;
    }
}

sub vcl_error {
    if (obj.status == 769) {
        set obj.http.Location = obj.response;
        set obj.status = 301;
        return(deliver);
    }
}

# WM1
sub vcl_recv {
    if (req.http.host == "wm1.com.br") {
        set req.http.host = "www.wm1.com.br";
        error 770 "https://" + req.http.host + req.url;
    }
}

sub vcl_error {
    if (obj.status == 770) {
        set obj.http.Location = obj.response;
        set obj.status = 301;
        return(deliver);
    }
}

# Shop Webmotors
sub vcl_recv {
    if (req.http.host == "shop.webmotors.com.br") {
        set req.http.host = "www.shopwebmotors.com.br";
        error 771 "https://" + req.http.host + req.url;
    }
}

sub vcl_error {
    if (obj.status == 771) {
        set obj.http.Location = obj.response;
        set obj.status = 301;
        return(deliver);
    }
}

# Paulistao
sub vcl_recv {
    if (req.http.host == "paulistao.webmotors.com.br") {
        set req.http.host = "vender.webmotors.com.br/?idcmp=t2:c18:m07:paulistao:corinsxpalm:estadioallianz:vt&utm_medium=CRM-Parceria_40&utm_source=paulistao&utm_campaign=corinsxpalm&utm_content=vt&utm_term=estadioallianz";
        error 772 "https://" + req.http.host + req.url;
    }
    if (req.http.host == "carglass.webmotors.com.br") {
        set req.http.host = "vender.webmotors.com.br/parceiro/carro?parceiro=wm&idcmp=t2:c18:m07:Carglass:CarGlaPar::Flyer&utm_medium=CRM-Parceria_20&utm_source=Carglass&utm_campaign=CarGlaPar&utm_content=Flyer&utm_term=";
        error 772 "https://" + req.http.host + req.url;
    }
}

sub vcl_error {
    if (obj.status == 772) {
        set obj.http.Location = obj.response;
        set obj.status = 301;
        return(deliver);
    }
}

# Vender /meiadesantos
sub vcl_recv {
    if (req.http.host == "vender.webmotors.com.br" && req.url ~ "^/meiadesantos/|^/meiadesantos") {
        set req.http.host = "vender.webmotors.com.br/?idcmp=t2:c18:m07:WebmotorsTV:MeiadeSantos::Evento&utm_medium=CRM-Parceria_20&utm_source=WebmotorsTV&utm_campaign=MeiadeSantos&utm_content=Evento&utm_term=";
        error 773 "https://" + req.http.host;
    }
}

sub vcl_error {
    if (obj.status == 773) {
        set obj.http.Location = obj.response;
        set obj.status = 302;
        return(deliver);
    }
}

# WEBMOTORS Productiom Redirects
sub vcl_recv {
    if (req.http.host == "www.webmotors.com.br" && req.url ~ "^/anunciante/login") {
        set req.http.host = "garagem.webmotors.com.br";
        error 774 "https://" + req.http.host;
    }
    if (req.http.host == "www.webmotors.com.br" && req.url ~ "^/anunciante/dadosanunciante") {
        set req.http.host = "garagem.webmotors.com.br";
        error 774 "https://" + req.http.host;
    }
    if (req.http.host == "www.webmotors.com.br" && req.url ~ "^/anuncie-mg") {
        set req.http.host = "vender.webmotors.com.br";
        error 774 "https://" + req.http.host;
    }
}

sub vcl_error {
    if (obj.status == 774) {
        set obj.http.Location = obj.response;
        set obj.status = 301;
        return(deliver);
    }
}

# Redirects Fluxo vender regionais
sub vcl_recv {
    if (req.http.host == "www.compreauto.com.br" && req.url ~ "^/vender/carro") {
        set req.http.host = "vender.webmotors.com.br/parceiro/carro?parceiro=compreauto";
        error 775 "https://" + req.http.host;
    }
    if (req.http.host == "www.compreauto.com.br" && req.url ~ "^/vender/moto") {
        set req.http.host = "vender.webmotors.com.br/parceiro/moto?parceiro=compreauto";
        error 775 "https://" + req.http.host;
    }
    if (req.http.host == "www.meucarango.com.br" && req.url ~ "^/vender/carro") {
        set req.http.host = "vender.webmotors.com.br/parceiro/carro?parceiro=meucarango";
        error 775 "https://" + req.http.host;
    }
    if (req.http.host == "www.meucarango.com.br" && req.url ~ "^/vender/moto") {
        set req.http.host = "vender.webmotors.com.br/parceiro/moto?parceiro=meucarango";
        error 775 "https://" + req.http.host;
    }

}

sub vcl_error {
    if (obj.status == 775) {
        set obj.http.Location = obj.response;
        set obj.status = 301;
        return(deliver);
    }
}

# Compra Segura to Auto Pago
sub vcl_recv {
    if (req.http.host == "comprasegura.webmotors.com.br") {
        set req.http.host = "autopago.webmotors.com.br";
        error 776 "https://" + req.http.host + req.url;
    }
}

sub vcl_error {
    if (obj.status == 776) {
        set obj.http.Location = obj.response;
        set obj.status = 301;
        return(deliver);
    }
}

# Vender /wm1
sub vcl_recv {
    if (req.http.host == "vender.webmotors.com.br" && req.url ~ "^/wm1/|^/wm1") {
        set req.http.host = "vender.webmotors.com.br/?idcmp=t2:c03:m01:webmotors:outbrainwm1vender::anuncio&utm_medium=display_30&utm_source=webmotors&utm_campaign=outbrainwm1vender&utm_content=anuncio&utm_term=";
        error 777 "https://" + req.http.host;
    }
}

sub vcl_error {
    if (obj.status == 777) {
        set obj.http.Location = obj.response;
        set obj.status = 302;
        return(deliver);
    }
}

# Catalogo <-> Webmotors (Esta deve ser sempre a ultima regra do arquivo)
sub vcl_recv {
    if (req.http.host == "catalogo.webmotors.com.br" && req.url == "/") {
        set req.http.host = "www.webmotors.com.br/catalogo/";
        error 999 "https://" + req.http.host;
    }
    if (req.http.host == "catalogo.webmotors.com.br" && req.url ~ "^/\?ref=b_h|/carroceria") {
        set req.http.host = "www.webmotors.com.br/catalogo";
        error 999 "https://" + req.http.host + req.url;
    }    
    else {
        set req.http.host = "www.webmotors.com.br";
        error 999 "https://" + req.http.host + req.url;
    }
}

sub vcl_error {
    if (obj.status == 999) {
        set obj.http.Location = obj.response;
        set obj.status = 301;
        return(deliver);
    }
}
