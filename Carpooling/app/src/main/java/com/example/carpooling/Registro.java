package com.example.carpooling;

import androidx.appcompat.app.AppCompatActivity;

import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;

public class Registro extends AppCompatActivity {
    EditText ide,career,nam,cel,apel,disca,pass;
    Button bguardar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registro);

        ide=(EditText)findViewById(R.id.cod);
        career=(EditText)findViewById(R.id.carrer);
        nam=(EditText)findViewById(R.id.name);
        cel=(EditText)findViewById(R.id.phone);
        apel=(EditText)findViewById(R.id.lastname);
        disca=(EditText)findViewById(R.id.discap);
        pass=(EditText)findViewById(R.id.psswd);
        bguardar=(Button)findViewById(R.id.regist);


        bguardar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new
                        Registro.CargarDatos().execute("http://10.0.2.2/carpool/registrar.php?Codigo="+ide.getText().toString()+"&Celular="+cel.getText().toString()+"&Nombre="+nam.getText().toString()+"&Apellido="+apel.getText().toString()+"&Cargo="+career.getText().toString()+"&Password="+pass.getText().toString()+"&Discapacidad="+disca.getText().toString());

            }
        });
    }
    private class ConsultarDatos extends AsyncTask<String, Void, String> {
        @Override
        protected String doInBackground(String... urls) {
            try {
                return downloadUrl(urls[0]);
            } catch (IOException e) {
                return "Unable to retrieve web page. URL may be invalid.";
            }
        }
        //************************************************************
        //METODO QUE PERMITE EXTRAER LOS DATOS DE LA BASE DE DATOS
        //************************************************************
        @Override
        protected void onPostExecute(String result) {
            JSONArray ja = null;
            try {
                ja = new JSONArray(result);
                ide.setText(ja.getString(0));
                career.setText(ja.getString(1));
                nam.setText(ja.getString(2));
                cel.setText(ja.getString(3));
                apel.setText(ja.getString(4));
                disca.setText(ja.getString(5));
                pass.setText(ja.getString(6));
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }
    //********************************************************************************
    //Clase que invoca el procedimiento para Inserción de datos en la Base de Datos
    //********************************************************************************
    private class CargarDatos extends AsyncTask<String, Void, String> {
        @Override
        protected String doInBackground(String... urls) {
            // params comes from the execute() call: params[0] is the url.
            try {
                return downloadUrl(urls[0]);
            } catch (IOException e) {
                return "Unable to retrieve web page. URL may be invalid.";
            }
        }
        // Ejecuta el resultado de la clase AsyncTask.
        @Override
        protected void onPostExecute(String result) {
            Toast.makeText(getApplicationContext(), "Los datos se guardaron éxitosamente", Toast.LENGTH_LONG).show();
        }
    }
    private String downloadUrl(String myurl) throws IOException {
        Log.i("URL",""+myurl);
        myurl = myurl.replace(" ","%20");
        InputStream is = null;
        int len = 500;
        try {
            URL url = new URL(myurl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setReadTimeout(10000 /* milliseconds */);
            conn.setConnectTimeout(15000 /* milliseconds */);
            conn.setRequestMethod("GET");
            conn.setDoInput(true);
            // Starts the query
            conn.connect();
            int response = conn.getResponseCode();
            Log.d("respuesta", "The response is: " + response);
            is = conn.getInputStream();
            String contentAsString = readIt(is, len);
            return contentAsString;
        } finally {
            if (is != null) {
                is.close();
            }
        }
    }
    public String readIt(InputStream stream, int len) throws IOException,
            UnsupportedEncodingException {
        Reader reader = null;
        reader = new InputStreamReader(stream, "UTF-8");
        char[] buffer = new char[len];
        reader.read(buffer);
        return new String(buffer);
    }
}