package Classes;



import view.cadastroDeAlunos;
import java.awt.Component;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.net.URL;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import view.telaPrincipal;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Douglas
 */
public class menuBarra extends JMenuBar {

 JMenuBar menuBar = new JMenuBar();

 public Component montaMenu(){
 //criação da barra de menu
 JMenuBar jMenuBar = new JMenuBar();

 //criação dos menus
 JMenu jMenuArquivo = new JMenu("Paginas");
 JMenuItem jMenuTelaPrincipal = new JMenuItem("Tela Principal");
 JMenuItem jMenuCadastrodealunos = new JMenuItem("Cadastro de alunos");
 JMenuItem jMenuCadastrodecolaboradores = new JMenuItem("Cadastro de colaboradores");

 jMenuArquivo.setIcon(new javax.swing.ImageIcon(getClass().getResource("/62866-page-with-curl-icon.png")));
 
 //adicionando menus à barra de menu
 jMenuBar.add(jMenuArquivo);


 //adicionando itens de menu ao menu arquivo
 jMenuArquivo.add(jMenuTelaPrincipal);
 jMenuArquivo.add(jMenuCadastrodealunos);
 //jMenuArquivo.addSeparator();
 jMenuArquivo.add(jMenuCadastrodecolaboradores);

 jMenuTelaPrincipal.addActionListener(new ActionListener() {
    @Override
    public void actionPerformed(ActionEvent e) {
        telaPrincipal cadAlun = new telaPrincipal();
        cadAlun.setVisible(true);
    }
});
 
 jMenuCadastrodealunos.addActionListener(new ActionListener() {
    @Override
    public void actionPerformed(ActionEvent e) {
        cadastroDeAlunos cadAlun = new cadastroDeAlunos();
        cadAlun.setVisible(true);
    }
});

jMenuCadastrodecolaboradores.addActionListener(new ActionListener() {
    @Override
    public void actionPerformed(ActionEvent e) {
     
    }
}); 
 
 //adicionando a barra de menu ao aplicativo
 return jMenuBar;
}

}
