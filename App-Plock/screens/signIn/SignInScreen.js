import React from 'react';
import ReactDOM from 'react-dom';
import {
  View,
  Image,
  Text,
  TextInput,
  Button,
  TouchableOpacity,
  StyleSheet,
  Alert,
} from 'react-native';
import HomeScreen from '../home/HomeScreen';
import {AsyncStorage} from 'react-native';
import ApolloClient from 'apollo-boost';
import gql from 'graphql-tag';
import { ApolloProvider, Query } from 'react-apollo';
import { useQuery } from '@apollo/react-hooks';



const client = new ApolloClient({ uri: 'https://localhost:3300/graphql' })
const { useEffect, useState } = React


export const SignInScreen = () => {
  const client = new ApolloClient({ uri: 'https://localhost:3300/graphql' })
  const [email, setEmail] = useState('')
  const [pass, setPassword] = useState('')

  const QUERY = gql`
  {
     query user{
      id
      name
      lastname
      email
      tracks{
        name
        status
      }
      projects{
        name
      }
      teams{
        name
      }
    }
  }`

  signIn = async () => {
    console.log('llegue');
    <ApolloProvider client={client}>
        <Query query={QUERY} >
        {({ loading, error, data }) => {
            if (loading || error)
              return Alert.alert('not work')
            return
              // <View style={{ flex: 1 }}>
              //   {this.state.isFontsLoaded ? <AppContainer /> : <View />}
              // </View>
              Alert.alert('it work ')
              console.log(data);
        }}
        </Query>
    </ApolloProvider>

  };

  return(
    <View style={styles.container}  >
      <View style={styles.welcomeContainer} >
        <Image
          source={
            __DEV__
              ? require('../home/68930.png')
              : require('../home/robot-prod.png')
          }
          style={styles.welcomeImage}/>
      </View>

      <View style={styles.acomodar}>
        <Text style={styles.getStartedText}>
          Inicia sesión
        </Text>

        <View style={styles.inputPlus}>
          <TextInput
            placeholder="Email"
            style={styles.input1}
            onChangeText={email => setEmail( email )}
            value={email}
            maxLength = {10}
          />

          <TextInput
            maxLength = {10}
            placeholder="Password"
            style={styles.input2}
            secureTextEntry={true}
            onChangeText={ pass => setPassword(pass)}
            value={pass}
          />
        </View>
        <View style={styles.centerButton}>
          <View style={styles.button}>
            <Button color="#F2B558" title="Iniciar Sesion" onPress={signIn} />
          </View>

          <View style={styles.button}>
            <Button color="#37435D" title="Crear usuario"  />
          </View>
        </View>
      </View>
    </View>
  );

  _handleCreateAccount = async () => {
  };

  signIn = async () => {
    <ApolloProvider client={client}>
        <Query query={QUERY} >
        {({ loading, error, data }) => {
            if (loading || error)
              return Alert.alert('not work')
            return
              // <View style={{ flex: 1 }}>
              //   {this.state.isFontsLoaded ? <AppContainer /> : <View />}
              // </View>
              Alert.alert('it work ')
              console.log(data);
        }}
        </Query>
    </ApolloProvider>

  };
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    backgroundColor: '#6b7a8f',
  },
  welcomeImage: {
    width: 250,
    height: 250,
    resizeMode: 'contain',
    marginTop: -10,
    marginLeft: 0,
  },
  welcomeContainer: {
    alignItems: 'center',
    marginTop: 10,
    marginBottom: 25,
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  input1: {
    margin: 15,
    marginTop: 8,
    height: 30,
    padding: 5,
    paddingRight: 144,
    paddingLeft: 15,
    fontSize: 16,
    marginBottom: 10,
    color: 'white',
    borderBottomWidth: 1,
    borderBottomColor: '#FFFFFF',
    alignSelf: 'flex-start',
  },
  input2: {
    margin: 15,
    marginTop: 8,
    height: 30,
    padding: 5,
    paddingRight: 104,
    paddingLeft: 15,
    fontSize: 16,
    marginBottom: 10,
    color: 'white',
    borderBottomWidth: 1,
    borderBottomColor: '#FFFFFF',
    alignSelf: 'flex-start',
  },
  inputPlus: {
    paddingLeft: 89,
    paddingTop: 20,
  },
  getStartedText: {
    marginTop: -10,
    fontSize: 17,
    color: '#37435D',
    lineHeight: 32,
    textAlign: 'center',
    backgroundColor: '#FFFFFF',
    height: 35,

  },
  button: {
    margin:10,
    paddingTop: 4,
    paddingBottom: 1,
    paddingRight: 40,
    paddingLeft: 40,
    marginTop: 5,
    width: 300,
    color: '#F13E3E',
  },
  acomodar:{
    marginBottom: 50,
  },
  centerButton:{
    alignItems:'center',
    paddingTop: 25,

  }
})
