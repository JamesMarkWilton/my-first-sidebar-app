import React from "react";
import { Button } from "@/components/ui/button";

export default function Demo() {
  return (
    <div>
      <h1>Demo of React and shadcn-ui</h1>
      <Button onClick={() => console.log("clicked!")}>Button</Button>
    </div>
  );
}
