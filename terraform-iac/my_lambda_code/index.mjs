import { DynamoDB } from "@aws-sdk/client-dynamodb";
import { DynamoDBDocument } from "@aws-sdk/lib-dynamodb";

const client = new DynamoDB({});
const dynamoDb = DynamoDBDocument.from(client);

export const handler = async (event, context) => {
  const currentTimestamp = new Date().toISOString();
  console.log(`Lambda triggered at: ${currentTimestamp}`);

  const params = {
    TableName: process.env.TABLE_NAME || "LambdaTriggeredEvents",
    Item: {
      id: context.awsRequestId,
      timestamp: currentTimestamp,
      message: "Lambda function triggered",
      newMessage: "New Message Column after module"
    },
  };

  try {
    await dynamoDb.put(params);
    console.log(
      `Item inserted successfully with ID: ${context.awsRequestId}`
    );
  } catch (error) {
    console.error("Error inserting item into DynamoDB:", error);
  }
};
