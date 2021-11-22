# VSCode - SDCC - PIC
Setup mínimo para utilizar o compilador [sdcc](http://sdcc.sourceforge.net/) no
 vscode para projetos de PIC18F.

## Dependencias
O sdcc só começou suporte mínimo para PIC na versão `4.1`. Os repositórios da
maioria dos sistemas Linux ainda estão com a versão `4.0`, então é necessário
compilar. É bem simples, o setup deles é padrão autotools. A melhor referência 
é o [manual oficial](http://sdcc.sourceforge.net/doc/sdccman.pdf#section.2.4).

## Conteúdo
Tudo que esse repositório faz é disponibilizar um `Makefile` e um `.vscode/settings.json`
contendo principalmente as informações de paths para as bibliotecas do PIC **em sistemas Linux**.

O `.json` do vscode nem sei se funciona para todo mundo, mas foi o que rodou na minha máquina.
## Futuro
Ainda to ponderando colocar isso em cmake, só tem mais dois trabalhos de PIC.
