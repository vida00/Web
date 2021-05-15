param($alvo)
if(!$alvo){
    echo "------------WEB RECON-------------"
    echo "Modo de uso: .\web.ps1 example.com"
    echo "Modo de uso: .\web.ps1 192.168.0.1"
    echo "------------WEB RECON-------------"
} else {
    echo "Alvo: $alvo"
    try{
        $c1=Invoke-WebRequest $alvo -Method Get
        $c2=Invoke-WebRequest $alvo -Method Options
        echo "Status: $($c1.statuscode) $($c1.statusdescription)"
        echo "Servidor: $($c1.headers.server)"
        echo "Metodos Permitidos: $($c2.headers.allow)"
        echo "Links:"
        $c1.links.href | Select-String ".com"
    } catch {
        echo "Erro"
        echo "Possiveis causas: Alvo inexistente, Alvo nao permite a request"
    }
}