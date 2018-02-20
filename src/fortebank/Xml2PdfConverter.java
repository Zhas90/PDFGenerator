package fortebank;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.xml.transform.Result;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.TransformerFactoryConfigurationError;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.fop.apps.FOPException;
import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;
import org.xml.sax.SAXException;

public class Xml2PdfConverter {

	public static void main(String[] args) {	
		xmlToPdfWithFop();
	}
	
	public static void xmlToPdfWithFop() {
        
        File xsltFile = new File("inputFiles/MyAccounts.xsl");     
        StreamSource source = new StreamSource(new File("inputFiles/MyAccounts.xml"));        
        StreamSource transformSource = new StreamSource(xsltFile);       
        FopFactory fopFactory = FopFactory.newInstance();       
        FOUserAgent foUserAgent = fopFactory.newFOUserAgent();     
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
     
        try {
			fopFactory.setUserConfig(new File("conf/fop.xconf"));
		} catch (SAXException | IOException e1) {	
			e1.printStackTrace();
		}
        
        Transformer xslfoTransformer;
        try
        {
            xslfoTransformer = TransformerFactory.newInstance().newTransformer(transformSource);      
            Fop fop;
            try
            {
                fop = fopFactory.newFop
                        (MimeConstants.MIME_PDF, foUserAgent, outStream);      
                Result res = new SAXResult(fop.getDefaultHandler());
               
                try
                {                   
                    xslfoTransformer.transform(source, res);
                    
                    File pdffile = new File("outFile/MyAccounts.pdf");
                    OutputStream out = new java.io.FileOutputStream(pdffile);
                    out = new java.io.BufferedOutputStream(out);
                    FileOutputStream str = new FileOutputStream(pdffile);
                    str.write(outStream.toByteArray());
                    str.close();
                    out.close();

                }
                catch (Exception e) {
                    e.printStackTrace();
                }
            }
            catch (FOPException e) {
                e.printStackTrace();
            }
        }
        catch (TransformerConfigurationException e) {
            e.printStackTrace();
        }
        catch (TransformerFactoryConfigurationError e) {
            e.printStackTrace();
        }
    }

}
