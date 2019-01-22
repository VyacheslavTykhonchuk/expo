import React from 'react';
import { Alert, Image, Text, View, WebView } from 'react-native';
import { DocumentPicker } from 'expo';
import Button from '../components/Button';

export default class DocumentPickerScreen extends React.Component {
  static navigationOptions = {
    title: 'DocumentPicker',
  };

  state = {
    document: null,
  };

  get html() {
    return '<!DOCTYPE html>\
    <html lang="en">\
    <head>\
      <meta charset="UTF-8">\
      <meta name="viewport" content="width=device-width, initial-scale=1.0">\
      <meta http-equiv="X-UA-Compatible" content="ie=edge">\
      <title>Document</title>\
    </head>\
    <body style="font: 1rem \'Fira Sans\', sans-serif; display: flex; justify-content: center; align-items: center; flex-direction: column;">\
      <h2>Web View Document Picker</h2>\
      <label\
        for="input_file">Choose file:\
      </label>\
      <input\
        type="file"\
        id="input_file"\
        accept="*/*"\
      >\
    </body>\
    </html>';
  }

  _openPicker = async () => {
    const result = await DocumentPicker.getDocumentAsync({});
    if (result.type === 'success') {
      this.setState({ document: result });
    } else {
      setTimeout(() => {
        Alert.alert('Document picked', JSON.stringify(result, null, 2));
      }, 100);
    }
  };

  _renderDocument() {
    if (this.state.document === null) {
      return null;
    }
    return (
      <View>
        {this.state.document.uri.match(/\.(png|jpg)$/gi) ? (
          <Image
            source={{ uri: this.state.document.uri }}
            resizeMode="cover"
            style={{ width: 100, height: 100 }}
          />
        ) : null}
        <Text>
          {this.state.document.name} ({this.state.document.size / 1000} KB)
        </Text>
      </View>
    );
  }

  render() {
    return (
      <View style={{ flex: 1, margin: 20 }}>
        <Button onPress={this._openPicker} title="Open document picker" />
        {this._renderDocument()}
        <WebView style={{ flex: 1 }} source={{ html: this.html }} />
      </View>
    );
  }
}
