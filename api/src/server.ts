import express from 'express';
import { ApolloServer } from 'apollo-server-express';
import mongoose from 'mongoose';
import { typeDefs } from './type-defs';
import { context } from './context';
import { resolvers } from './resolvers';

const PORT = process.env.PORT || 5000;
const MONGODB_CONNECTION = process.env.PORT || 'mongodb://localhost:27017/gtfs';

mongoose.connect(MONGODB_CONNECTION)
  .then(() => console.log('✅ MongoDB connected'))
  .catch(() => console.log('🆘 MongoDB failed to connect'))

const server = new ApolloServer({
  typeDefs,
  resolvers,
  context
});

const app = express();
server.applyMiddleware({ app, path: '/graphql' });

app.listen(PORT, () =>
  console.log(
    `🚀 Server ready at http://localhost:${PORT}${server.graphqlPath}`
  )
);
